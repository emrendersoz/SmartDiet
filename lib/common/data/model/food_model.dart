import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

// {"label": "Rice", "name": "Pilav", "calorie": 200, "unit": "gram"}

enum UnitEnum {
  gram('gram'),
  adet('adet'),
  bardak('bardak');

  const UnitEnum(this.value);
  final String value;
}

@freezed
class FoodModel with _$FoodModel {
  const factory FoodModel({
    String? label,
    String? name,
    int? calorie,
    UnitEnum? unit,
  }) = _FoodModel;

  const FoodModel._();

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  @override
  FoodModel fromJson(Map<String, dynamic> json) {
    return FoodModel.fromJson(json);
  }
}
