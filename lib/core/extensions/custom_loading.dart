import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/gen/assets.gen.dart';

Future<void> showLoading() async {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 5.0
    ..indicatorWidget = Assets.lotties.loading.lottie(width: 150)
    ..radius = 5.0
    ..contentPadding = const EdgeInsets.all(15)
    ..backgroundColor = Colors.grey.shade50
    ..indicatorColor = Colors.red
    ..textColor = Colors.white
    ..boxShadow = <BoxShadow>[]
    ..maskColor = Colors.grey.withOpacity(0.4)
    ..userInteractions = false
    ..dismissOnTap = false;
  return EasyLoading.show();
}

Future<void> dismissLoading() async {
  await EasyLoading.dismiss();
}
