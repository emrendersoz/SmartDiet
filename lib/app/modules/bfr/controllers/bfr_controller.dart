import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/store/index.dart';
import '../../../../common/utility/utils.dart';
import '../../../../core/widgets/custom_toast.dart';

class BfrController extends GetxController {
  RxDouble bfr = 0.0.obs;
  RxString bodyDesc = ''.obs;
  RxString gender = 'erkek'.obs;
  TextEditingController waistMeasurementController = TextEditingController();
  TextEditingController hipMeasurementController = TextEditingController();
  TextEditingController neckMeasurementController = TextEditingController();
  TextEditingController heightMeasurementController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final userStore = UserStore.to;

  void calculateBodyFatPercentage() {
    try {
      final waistMeasurement = double.parse(waistMeasurementController.text);
      final hipMeasurement = double.parse(hipMeasurementController.text);
      final neckMeasurement = double.parse(neckMeasurementController.text);
      final heightMeasurement = double.parse(heightMeasurementController.text);
      final age = int.parse(ageController.text);
      final isMale = gender.value == 'erkek';
      bfr.value = CommonUtils.calculateBodyFatPercentage(
        waistMeasurement: waistMeasurement,
        hipMeasurement: hipMeasurement,
        neckMeasurement: neckMeasurement,
        heightMeasurement: heightMeasurement,
        age: age,
        isMale: isMale,
      );
      bodyDesc.value = CommonUtils.getBodyFatDescription(bfr.value);
    } catch (e) {
      CustomToast.showError('Bilgileri doğru girdiğinizden emin olunuz');
    }
  }

  @override
  void onInit() {
    waistMeasurementController.text = '${userStore.user.value?.waist ?? ''}';
    hipMeasurementController.text = '${userStore.user.value?.hip ?? ''}';
    neckMeasurementController.text = '${userStore.user.value?.neck ?? ''}';
    heightMeasurementController.text = '${userStore.user.value?.height ?? ''}';
    ageController.text = '${userStore.user.value?.age ?? ''}';
    gender.value = (userStore.user.value?.gender ?? false) ? 'kadın' : 'erkek';

    calculateBodyFatPercentage();
    super.onInit();
  }
}
