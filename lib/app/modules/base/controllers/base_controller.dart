import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BaseController extends GetxController {
  PersistentTabController persistentTabController = PersistentTabController();

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    persistentTabController.addListener(() {
      currentIndex.value = persistentTabController.index;
    });
    super.onInit();
  }
}
