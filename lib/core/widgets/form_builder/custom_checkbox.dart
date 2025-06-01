import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.name,
    super.key,
    this.onChanged,
    this.title,
    this.initialValue,
    this.isListTile = true,
    this.validator,
    this.value,
  });

  final String name;
  final void Function(bool? val)? onChanged;
  final String? title;
  final bool? initialValue;
  final bool isListTile;
  final String? Function(bool? val)? validator;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      builder: (FormFieldState<bool> field) {
        return Column(
          children: [
            if (isListTile)
              buildListTile(context, field)
            else
              buildSwitch(field),
          ],
        );
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
      child: CupertinoCheckbox(
        value: value ?? field.value ?? false,
        onChanged: field.didChange,
        
      ),
    );
  }
}
