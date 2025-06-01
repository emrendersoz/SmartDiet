import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/custom_rich_text.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            Center(
              child: Text(
                'Smart Diet',
                style: context.theme.textTheme.titleLarge,
              ),
            ),
            const Spacer(),
            Text('Giriş', style: context.theme.textTheme.titleLarge),
            const Gap(18),
            CustomTextField(
              name: 'email',
              labelText: 'Email',
              controller: controller.emailTextController,
            ),
            const Gap(12),
            CustomTextField(
              name: 'password',
              labelText: 'Şifre',
              isPassword: true,
              controller: controller.passwordTextController,
            ),
            Gap(context.height * 0.05),
            ElevatedButton(
              onPressed: controller.login,
              child: const Text('Giriş Yap'),
            ).customExt.infinityWidth,
            const Gap(12),
            Center(
              child: CustomRichText(
                text: 'Henüz hesabınız yok mu? Kayıt Ol',
                color: ColorName.twNeutral400,
                patternList: [
                  'Kayıt Ol'.toRichTextPattern(
                    color: context.theme.colorScheme.primary,
                    onTap: () => Get.toNamed(Routes.REGISTER),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
