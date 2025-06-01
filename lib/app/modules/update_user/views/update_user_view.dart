import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/utility/form_validator_utils.dart';
import '../../../../core/widgets/form_builder/custom_dropdown_button.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../controllers/update_user_controller.dart';

class UpdateUserView extends GetView<UpdateUserController> {
  const UpdateUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Düzenle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(12),
              FormBuilder(
                key: controller.formKey,
                initialValue: controller.formInitialValues,
                child: Column(
                  children: [
                    CustomTextField(
                      name: controller.formEmail,
                      labelText: 'Email',
                      enabled: false,
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            name: controller.formName,
                            labelText: 'Ad',
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                              ],
                            ),
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: CustomTextField(
                            name: controller.formSurname,
                            labelText: 'Soyad',
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            name: controller.formAge,
                            labelText: 'Yaş',
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.integer,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            name: controller.formHeight,
                            labelText: 'Boy (cm)',
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.integer,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            name: controller.formWeight,
                            labelText: 'Kilo (kg)',
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.numeric,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            name: controller.formWaist,
                            keyboardType: TextInputType.number,
                            labelText: 'Bel ölçüsü (cm)',
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.integer,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            name: controller.formNeck,
                            labelText: 'Boyun ölçüsü (cm)',
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.integer,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            name: controller.formHip,
                            keyboardType: TextInputType.number,
                            labelText: 'Kalça ölçüsü (cm)',
                            validator: FormBuilderValidators.compose(
                              [
                                FormValidatorsUtils.required,
                                FormValidatorsUtils.integer,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    CustomDropdownButton(
                      name: controller.formGender,
                      labelText: 'Cinsiyet',
                      selectedItem: controller.formKey.currentState
                              ?.value[controller.formGender] as String? ??
                          'Erkek',
                      items: const ['Erkek', 'Kadın'],
                      validator: FormValidatorsUtils.required,
                    ),
                    const Gap(12),
                    FilledButton.tonal(
                      onPressed: controller.updateUser,
                      child: const Text('Güncelle'),
                    ).customExt.infinityWidth,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
