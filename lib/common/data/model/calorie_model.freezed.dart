// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calorie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalorieModel _$CalorieModelFromJson(Map<String, dynamic> json) {
  return _CalorieModel.fromJson(json);
}

/// @nodoc
mixin _$CalorieModel {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get calorie => throw _privateConstructorUsedError;
  double? get portion => throw _privateConstructorUsedError;
  String? get mealType => throw _privateConstructorUsedError;
  UnitEnum? get unit => throw _privateConstructorUsedError;
  @TimeStampSerializer()
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalorieModelCopyWith<CalorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalorieModelCopyWith<$Res> {
  factory $CalorieModelCopyWith(
          CalorieModel value, $Res Function(CalorieModel) then) =
      _$CalorieModelCopyWithImpl<$Res, CalorieModel>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? label,
      String? name,
      int? calorie,
      double? portion,
      String? mealType,
      UnitEnum? unit,
      @TimeStampSerializer() DateTime? createdDate});
}

/// @nodoc
class _$CalorieModelCopyWithImpl<$Res, $Val extends CalorieModel>
    implements $CalorieModelCopyWith<$Res> {
  _$CalorieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? calorie = freezed,
    Object? portion = freezed,
    Object? mealType = freezed,
    Object? unit = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      calorie: freezed == calorie
          ? _value.calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as int?,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as double?,
      mealType: freezed == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitEnum?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalorieModelImplCopyWith<$Res>
    implements $CalorieModelCopyWith<$Res> {
  factory _$$CalorieModelImplCopyWith(
          _$CalorieModelImpl value, $Res Function(_$CalorieModelImpl) then) =
      __$$CalorieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? label,
      String? name,
      int? calorie,
      double? portion,
      String? mealType,
      UnitEnum? unit,
      @TimeStampSerializer() DateTime? createdDate});
}

/// @nodoc
class __$$CalorieModelImplCopyWithImpl<$Res>
    extends _$CalorieModelCopyWithImpl<$Res, _$CalorieModelImpl>
    implements _$$CalorieModelImplCopyWith<$Res> {
  __$$CalorieModelImplCopyWithImpl(
      _$CalorieModelImpl _value, $Res Function(_$CalorieModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? label = freezed,
    Object? name = freezed,
    Object? calorie = freezed,
    Object? portion = freezed,
    Object? mealType = freezed,
    Object? unit = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$CalorieModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      calorie: freezed == calorie
          ? _value.calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as int?,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as double?,
      mealType: freezed == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitEnum?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalorieModelImpl extends _CalorieModel {
  const _$CalorieModelImpl(
      {this.id,
      this.userId,
      this.label,
      this.name,
      this.calorie,
      this.portion,
      this.mealType,
      this.unit,
      @TimeStampSerializer() this.createdDate})
      : super._();

  factory _$CalorieModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalorieModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final int? calorie;
  @override
  final double? portion;
  @override
  final String? mealType;
  @override
  final UnitEnum? unit;
  @override
  @TimeStampSerializer()
  final DateTime? createdDate;

  @override
  String toString() {
    return 'CalorieModel(id: $id, userId: $userId, label: $label, name: $name, calorie: $calorie, portion: $portion, mealType: $mealType, unit: $unit, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalorieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.calorie, calorie) || other.calorie == calorie) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, label, name, calorie,
      portion, mealType, unit, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalorieModelImplCopyWith<_$CalorieModelImpl> get copyWith =>
      __$$CalorieModelImplCopyWithImpl<_$CalorieModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalorieModelImplToJson(
      this,
    );
  }
}

abstract class _CalorieModel extends CalorieModel {
  const factory _CalorieModel(
      {final String? id,
      final String? userId,
      final String? label,
      final String? name,
      final int? calorie,
      final double? portion,
      final String? mealType,
      final UnitEnum? unit,
      @TimeStampSerializer() final DateTime? createdDate}) = _$CalorieModelImpl;
  const _CalorieModel._() : super._();

  factory _CalorieModel.fromJson(Map<String, dynamic> json) =
      _$CalorieModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get label;
  @override
  String? get name;
  @override
  int? get calorie;
  @override
  double? get portion;
  @override
  String? get mealType;
  @override
  UnitEnum? get unit;
  @override
  @TimeStampSerializer()
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$CalorieModelImplCopyWith<_$CalorieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
