// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calorie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalorieModelImpl _$$CalorieModelImplFromJson(Map<String, dynamic> json) =>
    _$CalorieModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      label: json['label'] as String?,
      name: json['name'] as String?,
      calorie: (json['calorie'] as num?)?.toInt(),
      portion: (json['portion'] as num?)?.toDouble(),
      mealType: json['mealType'] as String?,
      unit: $enumDecodeNullable(_$UnitEnumEnumMap, json['unit']),
      createdDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdDate'], const TimeStampSerializer().fromJson),
    );

Map<String, dynamic> _$$CalorieModelImplToJson(_$CalorieModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'label': instance.label,
      'name': instance.name,
      'calorie': instance.calorie,
      'portion': instance.portion,
      'mealType': instance.mealType,
      'unit': _$UnitEnumEnumMap[instance.unit],
      'createdDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdDate, const TimeStampSerializer().toJson),
    };

const _$UnitEnumEnumMap = {
  UnitEnum.gram: 'gram',
  UnitEnum.adet: 'adet',
  UnitEnum.bardak: 'bardak',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
