// ignore_for_file: avoid_dynamic_calls, no_default_cases

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

import '../../../../common/data/model/calorie_model.dart';
import '../../../../common/data/model/detector_model.dart';
import '../../../../common/data/model/food_model.dart';
import '../../../../common/data/service/calorie_service.dart';
import '../../../../common/store/index.dart';
import '../../../../core/extensions/custom_loading.dart';
import '../../../../core/extensions/form_builder_extensions.dart';
import '../../../../core/utility/image_utils.dart';
import '../../../../core/widgets/custom_toast.dart';

class DetectorController extends GetxController {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  TextEditingController portionController = TextEditingController();

  Rxn<DetectorModel> detectorModel = Rxn<DetectorModel>();
  Rxn<FoodModel> selectedFood = Rxn<FoodModel>();
  final configStore = ConfigStore.to;
  final userStore = UserStore.to;
  RxInt selectedMeal = 0.obs;
  List<String> meals = MealTypeEnum.values.map((e) => e.value).toList();

  Future<void> pickImage(bool fromGallery) async {
    try {
      final XFile? image;
      if (fromGallery) {
        image = await PickImage.pickImageFromGallery();
      } else {
        image = await PickImage.pickImageFromCamera();
      }

      if (image == null) return;
      final file = File(image.path);
      await showLoading();
      final model = await classifyImage(file);
      if (model == null) throw Exception('Model is null');

      final food = configStore.foods.firstWhere(
        (element) => element.label == model.label,
        orElse: () => throw Exception('Food not found'),
      );

      detectorModel.value = model.copyWith(image: file, name: food.name);
      selectedFood.value = food;
    } catch (e) {
      detectorModel.value = null;
      await CustomToast.showError('Bir hata oluştu');
    } finally {
      await dismissLoading();
    }
  }

  Future<DetectorModel?> classifyImage(File image) async {
    final results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.40,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (results == null) return null;
    if (results.isEmpty) return null;

    final model = DetectorModel(
      index: results[0]['index'] as int,
      label: results[0]['label'] as String,
      confidence: results[0]['confidence'] as double,
    );

    return model;
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model/food_model.tflite',
      labels: 'assets/model/food_labels.txt',
    );
  }

  Future<void> saveFood() async {
    try {
      if (formKey.saveAndValidate ?? false) {
        await showLoading();

        final totalCalorie = await calculateCalorie();
        final calorie = CalorieModel(
          userId: userStore.user.value?.id,
          label: selectedFood.value?.label,
          name: selectedFood.value?.name,
          calorie: totalCalorie,
          portion: double.tryParse(portionController.text),
          unit: selectedFood.value?.unit,
          mealType: meals[selectedMeal.value],
        );

        await CalorieService(userStore.user.value!.id!).addDocument(calorie);

        await CustomToast.showSuccess('Öğün başarıyla eklendi');

        formKey.currentState?.reset();
        selectedFood.value = null;
        detectorModel.value = null;
        portionController.clear();
      }
    } catch (e) {
      await CustomToast.showError('Bir hata oluştu');
    } finally {
      await dismissLoading();
    }
  }

  Future<int> calculateCalorie() async {
    switch (selectedFood.value?.unit) {
      case UnitEnum.gram:
        return ((selectedFood.value?.calorie ?? 0) *
                (double.tryParse(portionController.text) ?? 0)) ~/
            100;
      case UnitEnum.adet:
        return ((selectedFood.value?.calorie ?? 0) *
                (double.tryParse(portionController.text) ?? 0))
            .toInt();
      case UnitEnum.bardak:
        return ((selectedFood.value?.calorie ?? 0) *
                (double.tryParse(portionController.text) ?? 0))
            .toInt();
      default:
        return 0;
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  void onInit() {
    loadModel();
    super.onInit();
  }
}
