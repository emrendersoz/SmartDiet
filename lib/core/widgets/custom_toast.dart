// ignore_for_file: unnecessary_await_in_return

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static Future<bool?> showSuccess( [String? msg]) async {
    return await Fluttertoast.showToast(
      msg: msg ?? 'İşlem başarılı.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 14,
    );
  }

  static Future<bool?> showError([String? msg]) async {
    return await Fluttertoast.showToast(
      msg: msg ?? 'Bir hata oluştu. Lütfen tekrar deneyiniz.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14,
    );
  }
}
