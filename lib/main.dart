import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/utility/theme.dart';
import 'setup.dart';

void main() async {
  await AppSetup.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Diet',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      theme: AppTheme.light(context),
      getPages: AppPages.routes,
      builder: EasyLoading.init(
        builder: (context, child) => ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: FToastBuilder()(
            context,
            child,
          ),
        ),
      ),
    );
  }
}
