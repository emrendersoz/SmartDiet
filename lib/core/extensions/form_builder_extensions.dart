import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension CustomFormBuilderExtension on GlobalKey<FormBuilderState> {
  void get save => currentState?.save();

  bool? get saveAndValidate => currentState?.saveAndValidate();

  bool? get validate => currentState?.validate();

  Map<String, dynamic>? get values => currentState?.value;

  T? val<T>(String name) => currentState?.value[name] as T?;
}
