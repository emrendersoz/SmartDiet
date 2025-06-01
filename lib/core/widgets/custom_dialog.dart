// ignore_for_file: inference_failure_on_generic_invocation, inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<void> showDialog({
    String? title,
    String? btnCancelText,
    String? btnOkText,
    Widget? body,
    List<Widget>? actions,
    void Function()? onConfirm,
    void Function()? onCancel,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true,
    DialogType dialogType = DialogType.noHeader,
    Color? barrierColor,
    Color? dialogBackgroundColor,
    String? desc,
    TextStyle? descTextStyle,
    void Function(DismissType type)? onDismissCallback,
  }) {
    return AwesomeDialog(
      context: Get.context!,
      dialogType: dialogType,
      barrierColor: barrierColor,
      dialogBackgroundColor: dialogBackgroundColor,
      onDismissCallback: onDismissCallback,
      body: body,
      title: title,
      desc: desc,
      btnCancelOnPress: onCancel,
      btnOkOnPress: onConfirm,
      btnCancelText: btnCancelText,
      btnOkText: btnOkText,
      descTextStyle: descTextStyle,
      dismissOnTouchOutside: dismissOnTouchOutside,
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      headerAnimationLoop: false,
      titleTextStyle: Get.context!.textTheme.titleLarge,
    ).show();
  }
}
