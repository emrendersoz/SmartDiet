import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/store/index.dart';
import 'core/cache/shared_manager.dart';

class AppSetup {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _setSystemUi();
    await Firebase.initializeApp();

    await SharedManager.instance.init();
    Get
      ..put<ConfigStore>(ConfigStore())
      ..put<UserStore>(UserStore());

    await initializeDateFormatting('tr_TR');
  }

  static Future<void> _setSystemUi() async {
    if (GetPlatform.isAndroid) {
      const systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
