import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'detector_model.freezed.dart';
part 'detector_model.g.dart';

@freezed
class DetectorModel with _$DetectorModel {
  const factory DetectorModel({
    int? index,
    String? label,
    double? confidence,
    @JsonKey(includeToJson: false, includeFromJson: false) File? image,
    String? name,

  }) = _DetectorModel;

  const DetectorModel._();

  factory DetectorModel.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelFromJson(json);

  @override
  DetectorModel fromJson(Map<String, dynamic> json) {
    return DetectorModel.fromJson(json);
  }
}
