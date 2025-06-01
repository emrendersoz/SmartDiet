import 'package:get/get.dart';

import '../controllers/calculate_calorie_controller.dart';

class CalculateCalorieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculateCalorieController>(
      () => CalculateCalorieController(),
    );
  }
}
