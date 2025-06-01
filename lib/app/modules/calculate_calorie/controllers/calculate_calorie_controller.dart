import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utility/utils.dart';
import '../../../../core/widgets/custom_toast.dart';

class CalculateCalorieController extends GetxController {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  RxString gender = 'erkek'.obs;
  RxString activityLevel = 'sedentary'.obs;
  RxnDouble calories = RxnDouble();

  void calculateCalories() {
    try {
      calories.value = CommonUtils.calculateCalories(
        double.parse(weightController.text),
        double.parse(heightController.text),
        int.parse(ageController.text),
        gender.value,
        activityLevel.value,
      );
    } catch (e) {
      CustomToast.showError('Bilgileri doğru girdiğinizden emin olunuz');
    }
  }
}
