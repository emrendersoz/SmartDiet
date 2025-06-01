import 'package:get/get.dart';

import '../controllers/bfr_controller.dart';

class BfrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BfrController>(
      () => BfrController(),
    );
  }
}
