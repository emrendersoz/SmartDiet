import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/utils/firebase_helper.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends IFirebaseModel<UserModel> with _$UserModel {
  const factory UserModel({
    String? id,
    String? email,
    String? name,
    String? surname,
    int? age,
    double? weight,
    int? height,
    int? waist,
    int? hip,
    int? neck,
    bool? gender,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
