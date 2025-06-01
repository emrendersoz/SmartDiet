import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class CommonUtils {
  CommonUtils._();
  final CommonUtils _instance = CommonUtils._();
  CommonUtils get instance => _instance;

  static double calculateBodyFatPercentage({
    required double waistMeasurement,
    required double hipMeasurement,
    required double neckMeasurement,
    required double heightMeasurement,
    required int age,
    required bool isMale,
  }) {
    double bodyFatPercentage;

    if (isMale) {
      bodyFatPercentage = 495 /
              (1.0324 -
                  0.19077 * log10(waistMeasurement - neckMeasurement) +
                  0.15456 * log10(heightMeasurement)) -
          450;
    } else {
      bodyFatPercentage = 495 /
              (1.29579 -
                  0.35004 *
                      log10(
                        waistMeasurement + hipMeasurement - neckMeasurement,
                      ) +
                  (0.22100 * log10(heightMeasurement))) -
          450;
    }

    // bodyFatPercentage +=
    //     (age > 17) ? ((isMale) ? -16.2 : 5.4) : ((isMale) ? 1.51 : -2.18);

    return double.parse(bodyFatPercentage.toStringAsFixed(1)).abs();
  }

  static double log10(num x) => math.log(x) / math.ln10;

  static double calculateBMI({required double height, required double weight}) {
    final heightInMeters = height / 100;

    return double.parse(
      (weight / (heightInMeters * heightInMeters)).toStringAsFixed(1),
    );
  }

  static String getBodyType(double bmi) {
    if (bmi < 18.5) {
      return 'Zayıf';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Fazla Kilolu';
    } else {
      return 'Obez';
    }
  }

  static String getBodyFatDescription(double bodyFatPercentage) {
    if (bodyFatPercentage < 6) {
      return 'Ciddi tehlike altındasınız. Çok düşük bir vücut yağ yüzdesine sahipsiniz.';
    } else if (bodyFatPercentage >= 6 && bodyFatPercentage < 13) {
      return 'Sporcuların ve fitness meraklılarının sahip olabileceği düzeyde vücut yağına sahipsiniz.';
    } else if (bodyFatPercentage >= 13 && bodyFatPercentage < 17) {
      return 'Vücut yağ oranınız oldukça düşük. İyi bir sağlık seviyesinde olmalısınız.';
    } else if (bodyFatPercentage >= 17 && bodyFatPercentage < 24) {
      return 'Sağlıklı bir vücut yağ oranına sahipsiniz. Bu, genel olarak iyi bir sağlık seviyesinde olduğunuzu gösterir.';
    } else if (bodyFatPercentage >= 24 && bodyFatPercentage < 31) {
      return 'Ortalama bir vücut yağına sahipsiniz. Bu, çoğu insan için normal kabul edilir.';
    } else if (bodyFatPercentage >= 31 && bodyFatPercentage < 38) {
      return 'Ortalama bir insanın sahip olabileceği yüksek bir vücut yağına sahipsiniz.';
    } else {
      return 'Vücut yağ yüzdeniz çok yüksek. Sağlık riskleri taşıyorsunuz.';
    }
  }

  static double calculateCalories(
    double weight,
    double height,
    int age,
    String gender,
    String activityLevel,
  ) {
    late double bmr;
    late double calories;

    if (gender == 'erkek') {
      bmr = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    } else {
      bmr = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
    }

    if (activityLevel == 'sedentary') {
      calories = bmr * 1.2;
    } else if (activityLevel == 'lightlyActive') {
      calories = bmr * 1.375;
    } else if (activityLevel == 'moderatelyActive') {
      calories = bmr * 1.55;
    } else if (activityLevel == 'veryActive') {
      calories = bmr * 1.725;
    } else if (activityLevel == 'extraActive') {
      calories = bmr * 1.9;
    }
    return double.parse(calories.toStringAsFixed(1));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
