import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.copyWith(
      listTileTheme: context.theme.listTileTheme.copyWith(
        titleTextStyle: TextStyle(color: context.theme.colorScheme.onSurface),
        leadingAndTrailingTextStyle: context.theme.textTheme.bodyMedium
            ?.copyWith(color: context.theme.colorScheme.primary),
        dense: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            onPressed: () => CustomDialog.showDialog(
              title: 'Çıkış Yap',
              desc: 'Çıkış yapmak istediğinize emin misiniz?',
              onConfirm: controller.userStore.logout,
              onCancel: Get.back,
            ),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15),
            child: Theme(
              data: theme,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        FluttermojiCircleAvatar(
                          radius: 60,
                          backgroundColor: context
                              .theme.colorScheme.inversePrimary
                              .withOpacity(.2),
                        ),
                        Positioned(
                          bottom: -5,
                          right: -5,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => Get.bottomSheet(
                              SizedBox(
                                height: context.height * .8,
                                child: FluttermojiCustomizer(),
                              ).paddingOnly(bottom: 20),
                              barrierColor: Colors.grey.withOpacity(.1),
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: ColorName.twBlue100,
                              foregroundColor: Colors.black,
                              iconSize: 16,
                              minimumSize: const Size(32, 32),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.tonal(
                    onPressed: () => Get.toNamed(Routes.UPDATE_USER),
                    child: const Text('Profil Düzenle'),
                  ).customExt.infinityWidth,
                  Card(
                    child: ListTile(
                      title: const Text('Ad Soyad'),
                      trailing: Text(
                        '${controller.userStore.user.value?.name} ${controller.userStore.user.value?.surname}',
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('E-posta'),
                      trailing:
                          Text(controller.userStore.user.value?.email ?? ''),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Yaş'),
                            trailing: Text(
                              '${controller.userStore.user.value?.age ?? ''}',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Cinsiyet'),
                            trailing: Text(
                              controller.userStore.user.value?.gender == true
                                  ? 'Kadın'
                                  : 'Erkek',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Kilo (kg)'),
                            trailing: Text(
                              '${controller.userStore.user.value?.weight ?? ''}',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Boy (cm)'),
                            trailing: Text(
                              '${controller.userStore.user.value?.height ?? ''}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Bel (cm)'),
                            trailing: Text(
                              '${controller.userStore.user.value?.waist ?? ''}',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: const Text('Boyun (cm)'),
                            trailing: Text(
                              '${controller.userStore.user.value?.neck ?? ''}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('Kalça (cm)'),
                      trailing: Text(
                        '${controller.userStore.user.value?.hip ?? ''}',
                      ),
                    ),
                  ),
                  const Gap(4),
                  FilledButton(
                    onPressed: () => Get.toNamed(Routes.BMI),
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorName.twOrange400,
                    ),
                    child: const Text('Vücut Kitle İndeksi'),
                  ).customExt.infinityWidth,
                  FilledButton(
                    onPressed: () => Get.toNamed(Routes.BFR),
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorName.twBlue400,
                    ),
                    child: const Text('Vücut Yağ Oranı'),
                  ).customExt.infinityWidth,
                  FilledButton(
                    onPressed: () => Get.toNamed(Routes.CALCULATE_CALORIE),
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorName.twViolet400,
                    ),
                    child: const Text('Kalori hesabı'),
                  ).customExt.infinityWidth,
                  const Gap(90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
