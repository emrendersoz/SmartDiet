import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/utility/form_validator_utils.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../core/widgets/form_builder/custom_dropdown_button.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../controllers/detector_controller.dart';

class DetectorView extends GetView<DetectorController> {
  const DetectorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğün Ekle'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorName.twOrange500,
        foregroundColor: ColorName.twOrange100,
        onPressed: () => CustomBottomSheet.show(
          context,
          body: Column(
            // galeri veya kamera seçimi
            children: [
              const Gap(4),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Galeriden Seç'),
                onTap: () {
                  Get.back();
                  controller.pickImage(true);
                },
              ),
              const Gap(4),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kameradan Çek'),
                onTap: () {
                  Get.back();
                  controller.pickImage(false);
                },
              ),
            ],
          ),
        ),
        child: const Icon(Icons.image_search),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Obx(
            () => Column(
              children: [
                if (controller.detectorModel.value != null)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: Image.file(
                                controller.detectorModel.value!.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                color: context.theme.colorScheme.secondary
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.detectorModel.value?.name}',
                                  ),
                                  const Gap(8),
                                  Text(
                                    '% ${(controller.detectorModel.value!.confidence! * 100).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                const Gap(24),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomDropdownButton(
                        name: 'food',
                        hintText: 'Yemek Seçiniz',
                        selectedItem: controller.selectedFood.value,
                        items: controller.configStore.foods,
                        itemAsString: (item) => item?.name ?? '',
                        showSearchBox: true,
                        onChanged: (value) {
                          controller.detectorModel.value = null;
                          controller.selectedFood.value = value;
                          controller.portionController.clear();
                        },
                        validator: FormBuilderValidators.compose([
                          FormValidatorsUtils.required,
                        ]),
                      ),
                      const Gap(12),
                      if (controller.selectedFood.value != null)
                        CustomTextField(
                          name: 'portion',
                          labelText:
                              'Porsiyon${controller.selectedFood.value?.unit != null ? ' (${controller.selectedFood.value?.unit?.value})' : ''}',
                          controller: controller.portionController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          validator: FormBuilderValidators.compose([
                            FormValidatorsUtils.required,
                            FormValidatorsUtils.numeric,
                          ]),
                        )
                      else
                        const SizedBox(),
                      const Gap(12),
                      Wrap(
                        spacing: 4,
                        children: List<Widget>.generate(
                          controller.meals.length,
                          (int index) {
                            return ChoiceChip(
                              pressElevation: 0,
                              selectedColor: Colors.blue[300],
                              backgroundColor: Colors.grey[100],
                              label: Text(controller.meals[index]),
                              selected: controller.selectedMeal.value == index,
                              onSelected: (bool selected) => controller
                                  .selectedMeal.value = selected ? index : 0,
                            );
                          },
                        ).toList(),
                      ),
                      const Gap(24),
                      FilledButton(
                        onPressed: controller.saveFood,
                        child: const Text('Öğün Ekle'),
                      ).customExt.infinityWidth,
                    ],
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
