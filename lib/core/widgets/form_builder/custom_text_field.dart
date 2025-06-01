// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.name,
    this.showCursor = true,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.onTap,
    this.validator,
    this.autoValidateMode,
    this.onSubmitted,
    this.constraints,
    this.contentPadding,
    this.onEditingComplete,
    this.onTapOutside,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.valueTransformer,
    this.maxLines = 1,
    this.minLines,
  });

  final String name;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool enabled;
  final bool readOnly;
  final bool showCursor;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autoValidateMode;
  final void Function(String? value)? onSubmitted;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onEditingComplete;
  final void Function(PointerDownEvent event)? onTapOutside;
  final void Function(String? value)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final dynamic Function(String? value)? valueTransformer;
  final int? maxLines;
  final int? minLines;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: widget.controller,
      name: widget.name,
      obscureText: widget.isPassword && !isVisible,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      validator: widget.validator,
      onSubmitted: widget.onSubmitted,
      autovalidateMode: widget.autoValidateMode,
      onEditingComplete: widget.onEditingComplete,
      onTapOutside: widget.onTapOutside,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      valueTransformer: widget.valueTransformer,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        constraints: widget.constraints,
        contentPadding: widget.contentPadding,
        suffixIcon: widget.isPassword
            ? InkWell(
                splashColor: Colors.transparent,
                onTap: () => setState(() => isVisible = !isVisible),
                child: isVisible
                    ? Icon(
                        Icons.visibility,
                        color: context.theme.colorScheme.onSurface
                            .withOpacity(0.6),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: context.theme.colorScheme.onSurface
                            .withOpacity(0.6),
                      ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
