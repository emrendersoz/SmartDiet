// ignore_for_file: strict_raw_type

import 'package:form_builder_validators/form_builder_validators.dart';

class FormValidatorsUtils {
  FormValidatorsUtils._();

  static String? Function(dynamic) get required =>
      FormBuilderValidators.required(errorText: 'Bu alan boş bırakılamaz');

  static String? Function(String?) get email =>
      FormBuilderValidators.email(errorText: 'Geçerli bir email giriniz');

  static String? Function(String?) get numeric =>
      FormBuilderValidators.numeric(errorText: 'Sadece sayı girilebilir');

  static String? Function(String?) get integer =>
      FormBuilderValidators.integer(errorText: 'Sadece tam sayı girilebilir');

  static String? Function(String?) minLength(int length) =>
      FormBuilderValidators.minLength(
        length,
        errorText: 'En az $length karakter olmalıdır',
      );
  static String? Function(String?) equalLength(int length) =>
      FormBuilderValidators.equalLength(
        length,
        errorText: 'Tam olarak $length karakter olmalıdır',
      );
}
