// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectorModelImpl _$$DetectorModelImplFromJson(Map<String, dynamic> json) =>
    _$DetectorModelImpl(
      index: (json['index'] as num?)?.toInt(),
      label: json['label'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$DetectorModelImplToJson(_$DetectorModelImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'label': instance.label,
      'confidence': instance.confidence,
      'name': instance.name,
    };
