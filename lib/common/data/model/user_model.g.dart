// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toInt(),
      waist: (json['waist'] as num?)?.toInt(),
      hip: (json['hip'] as num?)?.toInt(),
      neck: (json['neck'] as num?)?.toInt(),
      gender: json['gender'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'waist': instance.waist,
      'hip': instance.hip,
      'neck': instance.neck,
      'gender': instance.gender,
    };
