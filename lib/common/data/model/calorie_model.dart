import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/utils/firebase_helper.dart';
import '../service/utils/serializer.dart';
import 'food_model.dart';

part 'calorie_model.freezed.dart';
part 'calorie_model.g.dart';

enum MealTypeEnum {
  kahvalti('Kahvaltı'),
  ogleYemegi('Öğle Yemeği'), 
  aksamYemegi('Akşam Yemeği'),  
  diger('Diğer');

  const MealTypeEnum(this.value);
  final String value;
}

@freezed
class CalorieModel extends IFirebaseModel<CalorieModel> with _$CalorieModel {
  const factory CalorieModel({
    String? id,
    String? userId,
    String? label,
    String? name,
    int? calorie,
    double? portion,
    String? mealType,
    UnitEnum? unit,
    @TimeStampSerializer() DateTime? createdDate,
  }) = _CalorieModel;

  const CalorieModel._();

  factory CalorieModel.fromJson(Map<String, dynamic> json) =>
      _$CalorieModelFromJson(json);

  @override
  CalorieModel fromJson(Map<String, dynamic> json) {
    return CalorieModel.fromJson(json);
  }
}
