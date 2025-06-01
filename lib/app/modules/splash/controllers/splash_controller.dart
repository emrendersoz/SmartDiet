import 'package:get/get.dart';
import 'package:smart_diet/common/store/user.dart';
import 'package:smart_diet/core/cache/shared_manager.dart';

class SplashController extends GetxController {
  final userStore = UserStore.to;
  final sharedManager = SharedManager.instance;

  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final user = await userStore.getUserDetails();
    await userStore.login(user);
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }
}
