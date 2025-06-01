import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../data/model/user_model.dart';
import '../data/service/auth_service.dart';
import '../data/service/user_service.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final AuthService _authService = AuthService.instance;
  final UserService _userService = UserService.instance;

  final Rxn<UserModel> user = Rxn<UserModel>();

  Future<void> login(UserModel? cur) async {
    user.value = cur;
    if (user.value == null) await logout();
    await Get.offAllNamed<dynamic>(Routes.BASE);
  }

  Future<void> logout() async {
    user.value = null;
    await _authService.logout();
    await Get.offAllNamed<dynamic>(Routes.LOGIN);
  }

  Future<UserModel?> getUserDetails() async {
    try {
      final uid = _authService.userId;
      if (uid == null) throw Exception('User is null');
      final res = await _userService.getDocumentById(uid);
      user.value = res;
      return res;
    } catch (e) {
      await logout();
    }
    return null;
  }
}
