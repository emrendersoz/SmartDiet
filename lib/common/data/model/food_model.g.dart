// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodModelImpl _$$FoodModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodModelImpl(
      label: json['label'] as String?,
      name: json['name'] as String?,
      calorie: (json['calorie'] as num?)?.toInt(),
      unit: $enumDecodeNullable(_$UnitEnumEnumMap, json['unit']),
    );

Map<String, dynamic> _$$FoodModelImplToJson(_$FoodModelImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'name': instance.name,
      'calorie': instance.calorie,
      'unit': _$UnitEnumEnumMap[instance.unit],
    };

const _$UnitEnumEnumMap = {
  UnitEnum.gram: 'gram',
  UnitEnum.adet: 'adet',
  UnitEnum.bardak: 'bardak',
};
