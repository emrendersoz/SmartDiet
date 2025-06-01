import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  const BmiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Vücut Kitle İndeksi'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Gap(24),
                if (controller.bmi.value != 0.0)
                  Card(
                    color: controller.bodyType.value == 'Zayıf'
                        ? ColorName.twOrange500
                        : controller.bodyType.value == 'Normal'
                            ? ColorName.twGreen500
                            : ColorName.twRed500,
                    child: ListTile(
                      leading: const Icon(Icons.verified, color: Colors.white),
                      title: Text(
                        'Vücut Kitle İndeksiniz',
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        controller.bodyType.value,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text(
                        controller.bmi.value.toStringAsFixed(2),
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                const Gap(24),
                CustomTextField(
                  name: 'height',
                  labelText: 'Boyunuz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.heightController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'weight',
                  labelText: 'Kilonuz (kg)',
                  keyboardType: TextInputType.number,
                  controller: controller.weightController,
                ),
                const Gap(24),
                FilledButton(
                  onPressed: controller.calculateBMI,
                  child: const Text('Hesapla'),
                ).customExt.infinityWidth,
                const Gap(12),
                //info card
                Card(
                  child: ListTile(
                    title: const Text(
                      'Vücut Kitle İndeksi (VKİ) Nedir?',
                      style: TextStyle(
                        color: ColorName.twBlue500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Vücut kitle indeksi (VKİ), kilonuzun boyunuza oranlanmasıyla elde edilen bir değerdir.\n\n18.5'tan küçükse zayıf\n18.5-24.9 arasında ise normal\n25-29.9 arasında ise fazla kilolu\n30 ve üzeri ise obez olarak kabul edilir.",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: ColorName.twNeutral500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
