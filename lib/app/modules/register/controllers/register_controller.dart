//part

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../common/data/model/user_model.dart';
import '../../../../common/data/service/auth_service.dart';
import '../../../../common/data/service/user_service.dart';
import '../../../../common/store/index.dart';
import '../../../../core/extensions/custom_loading.dart';
import '../../../../core/extensions/form_builder_extensions.dart';
import '../../../../core/widgets/custom_toast.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final String formEmail = 'email';
  final String formName = 'name';
  final String formSurname = 'surname';
  final String formPass = 'pass';
  final String formPassAgain = 'passAgain';
  final String formAge = 'age';
  final String formWeight = 'weight';
  final String formHeight = 'height';
  final String formWaist = 'waist';
  final String formHip = 'hip';
  final String formNeck = 'neck';
  final String formGender = 'gender';

  AuthService authService = AuthService.instance;
  UserService userService = UserService.instance;
  UserStore userStore = UserStore.to;

  Future<void> register() async {
    if (formKey.saveAndValidate!) {
      final email = formKey.val<String>(formEmail) ?? '';
      final name = formKey.val<String>(formName) ?? '';
      final surname = formKey.val<String>(formSurname) ?? '';
      final pass = formKey.val<String>(formPass) ?? '';
      final passAgain = formKey.val<String>(formPassAgain) ?? '';
      final age = formKey.val<String>(formAge) ?? '';
      final weight = formKey.val<String>(formWeight) ?? '';
      final height = formKey.val<String>(formHeight) ?? '';
      final waist = formKey.val<String>(formWaist) ?? '';
      final hip = formKey.val<String>(formHip) ?? '';
      final neck = formKey.val<String>(formNeck) ?? '';
      final gender = formKey.val<String>(formGender) == 'Kadın';

      if (pass != passAgain) {
        await CustomToast.showError('Şifreler uyuşmuyor');
        return;
      }

      await showLoading();
      try {
        final uid =
            await authService.createUserWithEmailAndPassword(email, pass);
        formKey.currentState?.reset();
        await CustomToast.showSuccess('Kayıt başarılı');

        if (uid == null) throw Exception('Kullanıcı bulunamadı');

        final user = UserModel(
          id: uid,
          email: email,
          name: name,
          surname: surname,
          age: int.parse(age),
          weight: double.parse(weight),
          height: int.parse(height),
          waist: int.parse(waist),
          hip: int.parse(hip),
          neck: int.parse(neck),
          gender: gender,
        );

        await userService.addDocumentByID(user.id!, user);
        await dismissLoading();
        await userStore.login(user);
      } on FirebaseException catch (e) {
        await CustomToast.showError(e.message);
      } catch (e) {
        await CustomToast.showError(
          'Bir hata oluştu. Lütfen tekrar deneyiniz.',
        );
      } finally {
        await dismissLoading();
      }
    }
  }
}
