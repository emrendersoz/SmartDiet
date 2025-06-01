import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/data/service/auth_service.dart';
import '../../../../common/data/service/user_service.dart';
import '../../../../common/store/index.dart';
import '../../../../core/extensions/custom_loading.dart';
import '../../../../core/widgets/custom_toast.dart';

class LoginController extends GetxController {
  final _authService = AuthService.instance;
  final _userService = UserService.instance;
  final userStore = UserStore.to;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<void> login() async {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    if (email.isEmpty || password.isEmpty) return;

    try {
      await showLoading();
      final uid =
          await _authService.signInWithEmailAndPassword(email, password);

      if (uid == null) throw Exception('Kullanıcı bulunamadı');

      final user = await _userService.getDocumentById(uid);
      await dismissLoading();
      await userStore.login(user);
    } on FirebaseException catch (e) {
      await CustomToast.showError(e.message ?? 'Bir hata oluştu');
    } catch (e) {
      await CustomToast.showError();
    } finally {
      await dismissLoading();
    }
  }
}
