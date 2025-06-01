import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_diet/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: controller,
      initState: (_) {},
      builder: (_) {
        return const Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
