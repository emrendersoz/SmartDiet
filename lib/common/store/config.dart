import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/model/food_model.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();
  RxList<FoodModel> foods = <FoodModel>[].obs;

  Future<void> initialize() async { 

    final json = await rootBundle.loadString('assets/model/foods.json');
    final data = jsonDecode(json) as List;
    foods.value =
        data.map((e) => FoodModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
