import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class CustomFormSwitch extends StatelessWidget {
  const CustomFormSwitch({
    required this.name,
    super.key,
    this.onChanged,
    this.title,
    this.initialValue,
    this.isListTile = true,
  });

  final String name;
  final void Function(bool? val)? onChanged;
  final String? title;
  final bool? initialValue;
  final bool isListTile;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      onChanged: onChanged,
      initialValue: initialValue,
      builder: (FormFieldState<bool> field) {
        return isListTile ? buildListTile(context, field) : buildSwitch(field);
      },
    );
  }

  ListTile buildListTile(BuildContext context, FormFieldState<bool> field) {
    return ListTile(
      title: Text(
        title ?? '',
        style: context.textTheme.bodyMedium,
      ),
      dense: true,
      visualDensity: const VisualDensity(
        horizontal: -4,
        vertical: -4,
      ),
      contentPadding:
          context.general.appTheme.inputDecorationTheme.contentPadding,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.general.appTheme.inputDecorationTheme.border
                  ?.borderSide.color ??
              Colors.transparent,
        ),
      ),
      trailing: buildSwitch(field),
    );
  }

  Transform buildSwitch(FormFieldState<bool> field) {
    return Transform.scale(
      scale: .8,
      child: CupertinoSwitch(
        value: field.value ?? false,
        onChanged: field.didChange,
      ),
    );
  }
}
