import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.text,
    super.key,
    this.onTap,
    this.color,
    this.patternList,
    this.defaultStyle,
    this.textAlign,
  });
  final void Function()? onTap;
  final String text;
  final Color? color;
  final List<EasyRichTextPattern>? patternList;
  final TextStyle? defaultStyle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return EasyRichText(
      text,
      textAlign:textAlign ?? TextAlign.start,
      defaultStyle: defaultStyle ??
          Get.context!.general.textTheme.bodyMedium?.copyWith(color: color),
      patternList: patternList,
    );
  }
}

extension RichTextPatternExtension on String {
  EasyRichTextPattern toRichTextPattern({
    FontWeight? weight = FontWeight.normal,
    Color? color,
    void Function()? onTap,
  }) =>
      EasyRichTextPattern(
        targetString: this,
        style: TextStyle(color: color, fontWeight: weight),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      );
}
