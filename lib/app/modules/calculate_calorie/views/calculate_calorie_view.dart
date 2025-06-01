import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../controllers/calculate_calorie_controller.dart';

class CalculateCalorieView extends GetView<CalculateCalorieController> {
  const CalculateCalorieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalori hesapla'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(20),
                if (controller.calories.value != null)
                  Card(
                    color: context.theme.colorScheme.primary,
                    child: ListTile(
                      leading: const Icon(Icons.verified, color: Colors.white),
                      title: Text(
                        'Günlük Kalori İhtiyacınız',
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                      trailing: Text(
                        '${controller.calories.value} kcal',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                const Gap(20),
                CustomTextField(
                  name: 'height',
                  hintText: 'Boyunuz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.heightController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'weight',
                  hintText: 'Kilonuz (kg)',
                  keyboardType: TextInputType.number,
                  controller: controller.weightController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'age',
                  hintText: 'Yaşınız ',
                  keyboardType: TextInputType.number,
                  controller: controller.ageController,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: RadioButton(
                        description: 'Erkek',
                        value: 'erkek',
                        groupValue: controller.gender.value,
                        onChanged: (value) =>
                            controller.gender.value = value ?? '',
                      ),
                    ),
                    Expanded(
                      child: RadioButton(
                        description: 'Kadın',
                        value: 'kadın',
                        groupValue: controller.gender.value,
                        onChanged: (value) =>
                            controller.gender.value = value ?? '',
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          RadioButton(
                            description: 'Hareketsiz',
                            value: 'sedentary',
                            groupValue: controller.activityLevel.value,
                            onChanged: (value) =>
                                controller.activityLevel.value = value ?? '',
                          ),
                          RadioButton(
                            description: 'Biraz aktif',
                            value: 'lightlyActive',
                            groupValue: controller.activityLevel.value,
                            onChanged: (value) =>
                                controller.activityLevel.value = value ?? '',
                          ),
                          RadioButton(
                            description: 'Haftada 3-4 egzersiz',
                            value: 'moderatelyActive',
                            groupValue: controller.activityLevel.value,
                            onChanged: (value) =>
                                controller.activityLevel.value = value ?? '',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RadioButton(
                            description: 'Haftada 5-7 egzersiz',
                            value: 'veryActive',
                            groupValue: controller.activityLevel.value,
                            onChanged: (value) =>
                                controller.activityLevel.value = value ?? '',
                          ),
                          RadioButton(
                            description: 'Yoğun egzersiz',
                            value: 'extraActive',
                            groupValue: controller.activityLevel.value,
                            onChanged: (value) =>
                                controller.activityLevel.value = value ?? '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: controller.calculateCalories,
                  child: const Text('Hesapla'),
                ).customExt.infinityWidth,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
