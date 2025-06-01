import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../common/gen/assets.gen.dart';
import '../../../../common/gen/colors.gen.dart';
import '../../detector/views/detector_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => PersistentTabView(
          resizeToAvoidBottomInset: false,
          controller: controller.persistentTabController,
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.persistentTabController.jumpToTab(1),
            elevation: 4,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          tabs: [
            PersistentTabConfig(
              screen: const HomeView(),
              item: ItemConfig(
                icon: Assets.icons.home.svg(
                  width: 28,
                  height: 28,
                  colorFilter: controller.currentIndex.value != 0
                      ? const ColorFilter.mode(
                          ColorName.twNeutral200,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                inactiveForegroundColor: ColorName.twNeutral300,
                title: 'Anasayfa',
                activeColorSecondary: Colors.transparent,
              ),
            ),
            PersistentTabConfig(
              screen: const DetectorView(),
              item: ItemConfig(
                icon: const Icon(Icons.add, color: Colors.white),
                activeColorSecondary: Colors.transparent,
              ),
            ),
            PersistentTabConfig(
              screen: const ProfileView(),
              item: ItemConfig(
                icon: Assets.icons.user.svg(
                  width: 28,
                  height: 28,
                  colorFilter: controller.currentIndex.value != 2
                      ? const ColorFilter.mode(
                          ColorName.twNeutral200,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
                title: 'Profil',
                inactiveForegroundColor: ColorName.twNeutral300,
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              backgroundBlendMode: BlendMode.srcOver,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              border: Border(
                top: BorderSide(
                  color: context.theme.colorScheme.primaryContainer,
                  width: .7,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
