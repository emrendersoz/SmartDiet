import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../controllers/bfr_controller.dart';

class BfrView extends GetView<BfrController> {
  const BfrView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vücut Yağ Oranı'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                if (controller.bfr.value != 0.0)
                  Card(
                    color: controller.bfr.value < 6
                        ? ColorName.twRed500
                        : controller.bfr.value >= 6 && controller.bfr.value < 13
                            ? ColorName.twOrange500
                            : controller.bfr.value >= 13 &&
                                    controller.bfr.value < 17
                                ? ColorName.twYellow500
                                : controller.bfr.value >= 17 &&
                                        controller.bfr.value < 24
                                    ? ColorName.twGreen500
                                    : controller.bfr.value >= 24 &&
                                            controller.bfr.value < 31
                                        ? ColorName.twBlue500
                                        : controller.bfr.value >= 31 &&
                                                controller.bfr.value < 38
                                            ? ColorName.twIndigo500
                                            : ColorName.twRed500,
                    child: ListTile(
                      leading: const Icon(Icons.verified, color: Colors.white),
                      title: Text(
                        'Vücut Yağ Oranınız',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text(
                        controller.bfr.value.toStringAsFixed(1),
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        controller.bodyDesc.value,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                const Gap(24),
                CustomTextField(
                  name: 'weight',
                  labelText: 'Yaşınız',
                  keyboardType: TextInputType.number,
                  controller: controller.ageController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'height',
                  labelText: 'Boyunuz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.heightMeasurementController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'neck',
                  labelText: 'Boyun çevreniz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.neckMeasurementController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'waist',
                  labelText: 'Bel çevreniz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.waistMeasurementController,
                ),
                const Gap(12),
                CustomTextField(
                  name: 'hip',
                  labelText: 'Kalça çevreniz (cm)',
                  keyboardType: TextInputType.number,
                  controller: controller.hipMeasurementController,
                ),
                const SizedBox(height: 20),
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
                const Gap(12),
                FilledButton(
                  onPressed: controller.calculateBodyFatPercentage,
                  child: const Text('Hesapla'),
                ).customExt.infinityWidth,
                const Gap(12),
                // info card
                Card(
                  child: ListTile(
                    title: const Text(
                      'Vücut Yağ Oranı Nedir?',
                      style: TextStyle(
                        color: ColorName.twBlue500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //  "Vücut kitle indeksi (VKİ), kilonuzun boyunuza oranlanmasıyla elde edilen bir değerdir.\n\n18.5'tan küçükse zayıf\n18.5-24.9 arasında ise normal\n25-29.9 arasında ise fazla kilolu\n30 ve üzeri ise obez olarak kabul edilir.",

                    subtitle: Text(
                      "Vücut yağ oranı, vücudunuzdaki yağ miktarını kas, kemik ve diğer dokulara oranla belirler. Vücut yağ oranınızı ölçmek, sağlık ve fitness seviyenizi değerlendirmenin bir yoludur. Vücut yağ oranınızı ölçmek, sağlık ve fitness seviyenizi değerlendirmenin bir yoludur.\n\n6'dan küçükse ciddi tehlike\n6-13 arasında ise sporcuların ve fitness meraklılarının sahip olabileceği düzeyde\n13-17 arasında ise oldukça düşük\n17-24 arasında ise sağlıklı\n24-31 arasında ise ortalama\n31-38 arasında ise yüksek\n38 ve üzeri ise çok yüksek",
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
