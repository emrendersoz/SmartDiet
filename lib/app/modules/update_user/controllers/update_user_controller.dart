import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../common/data/service/auth_service.dart';
import '../../../../common/data/service/user_service.dart';
import '../../../../common/store/index.dart';
import '../../../../core/extensions/custom_loading.dart';
import '../../../../core/extensions/form_builder_extensions.dart';
import '../../../../core/widgets/custom_toast.dart';

class UpdateUserController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final String formEmail = 'email';
  final String formName = 'name';
  final String formSurname = 'surname'; 
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

  Map<String, dynamic> get formInitialValues => {
        formEmail: userStore.user.value?.email,
        formName: userStore.user.value?.name,
        formSurname: userStore.user.value?.surname,
        formAge: userStore.user.value?.age.toString(),
        formWeight: userStore.user.value?.weight.toString(),
        formHeight: userStore.user.value?.height.toString(),
        formWaist: userStore.user.value?.waist.toString(),
        formHip: userStore.user.value?.hip.toString(),
        formNeck: userStore.user.value?.neck.toString(),
        formGender:
            (userStore.user.value?.gender ?? false) == true ? 'Kadın' : 'Erkek',
      };

  Future<void> updateUser() async {
    try {
      await showLoading();

      if (formKey.saveAndValidate ?? false) { 

        final email = formKey.val<String>(formEmail);
        final name = formKey.val<String>(formName);
        final surname = formKey.val<String>(formSurname);
        final age = formKey.val<String>(formAge) ?? '';
        final weight = formKey.val<String>(formWeight) ?? '';
        final height = formKey.val<String>(formHeight) ?? '';
        final waist = formKey.val<String>(formWaist) ?? '';
        final hip = formKey.val<String>(formHip) ?? '';
        final neck = formKey.val<String>(formNeck) ?? '';
        final gender = formKey.val<String>(formGender) == 'Kadın';

        final newUser = userStore.user.value?.copyWith(
          email: email,
          name: name,
          surname: surname,
          age: int.tryParse(age),
          weight: double.tryParse(weight),
          height: int.tryParse(height),
          waist: int.tryParse(waist),
          hip: int.tryParse(hip),
          neck: int.tryParse(neck),
          gender: gender,
        );

        await userService.updateDocument(newUser!.id ?? '', newUser);

        await CustomToast.showSuccess('Kullanıcı bilgileri güncellendi');

        userStore.user.value = newUser;

        await dismissLoading();
        Get.back();
      }
    } catch (e) {
      await CustomToast.showError('Bir hata oluştu');
    } finally {
      await dismissLoading();
    }
  }
}
