// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detector_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectorModel _$DetectorModelFromJson(Map<String, dynamic> json) {
  return _DetectorModel.fromJson(json);
}

/// @nodoc
mixin _$DetectorModel {
  int? get index => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  double? get confidence => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get image => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetectorModelCopyWith<DetectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectorModelCopyWith<$Res> {
  factory $DetectorModelCopyWith(
          DetectorModel value, $Res Function(DetectorModel) then) =
      _$DetectorModelCopyWithImpl<$Res, DetectorModel>;
  @useResult
  $Res call(
      {int? index,
      String? label,
      double? confidence,
      @JsonKey(includeToJson: false, includeFromJson: false) File? image,
      String? name});
}

/// @nodoc
class _$DetectorModelCopyWithImpl<$Res, $Val extends DetectorModel>
    implements $DetectorModelCopyWith<$Res> {
  _$DetectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? confidence = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectorModelImplCopyWith<$Res>
    implements $DetectorModelCopyWith<$Res> {
  factory _$$DetectorModelImplCopyWith(
          _$DetectorModelImpl value, $Res Function(_$DetectorModelImpl) then) =
      __$$DetectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String? label,
      double? confidence,
      @JsonKey(includeToJson: false, includeFromJson: false) File? image,
      String? name});
}

/// @nodoc
class __$$DetectorModelImplCopyWithImpl<$Res>
    extends _$DetectorModelCopyWithImpl<$Res, _$DetectorModelImpl>
    implements _$$DetectorModelImplCopyWith<$Res> {
  __$$DetectorModelImplCopyWithImpl(
      _$DetectorModelImpl _value, $Res Function(_$DetectorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? confidence = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_$DetectorModelImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectorModelImpl extends _DetectorModel {
  const _$DetectorModelImpl(
      {this.index,
      this.label,
      this.confidence,
      @JsonKey(includeToJson: false, includeFromJson: false) this.image,
      this.name})
      : super._();

  factory _$DetectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectorModelImplFromJson(json);

  @override
  final int? index;
  @override
  final String? label;
  @override
  final double? confidence;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? image;
  @override
  final String? name;

  @override
  String toString() {
    return 'DetectorModel(index: $index, label: $label, confidence: $confidence, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorModelImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, index, label, confidence, image, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectorModelImplCopyWith<_$DetectorModelImpl> get copyWith =>
      __$$DetectorModelImplCopyWithImpl<_$DetectorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectorModelImplToJson(
      this,
    );
  }
}

abstract class _DetectorModel extends DetectorModel {
  const factory _DetectorModel(
      {final int? index,
      final String? label,
      final double? confidence,
      @JsonKey(includeToJson: false, includeFromJson: false) final File? image,
      final String? name}) = _$DetectorModelImpl;
  const _DetectorModel._() : super._();

  factory _DetectorModel.fromJson(Map<String, dynamic> json) =
      _$DetectorModelImpl.fromJson;

  @override
  int? get index;
  @override
  String? get label;
  @override
  double? get confidence;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get image;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$DetectorModelImplCopyWith<_$DetectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
