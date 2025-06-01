import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/store/index.dart';
import '../../../../common/utility/utils.dart';
import '../../../../core/widgets/custom_toast.dart';

class BmiController extends GetxController {
  RxDouble bmi = 0.0.obs;
  RxString bodyType = ''.obs;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final userStore = UserStore.to;

  void calculateBMI() {
    try {
      bmi.value = CommonUtils.calculateBMI(
        height: double.parse(heightController.value.text),
        weight: double.parse(weightController.value.text),
      );
      bodyType.value = CommonUtils.getBodyType(bmi.value);
    } catch (e) {
      CustomToast.showError('Bilgileri doğru girdiğinizden emin olunuz');
    }
  }

  @override
  onInit() {
    heightController.text = '${userStore.user.value?.height ?? ''}';
    weightController.text = '${userStore.user.value?.weight ?? ''}';
    calculateBMI();
    super.onInit();
  }
}
