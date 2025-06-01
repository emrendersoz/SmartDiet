import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/utility/form_validator_utils.dart';
import '../../../../core/widgets/custom_rich_text.dart';
import '../../../../core/widgets/form_builder/custom_dropdown_button.dart';
import '../../../../core/widgets/form_builder/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'),
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
                child: Column(
                  children: [
                    CustomTextField(
                      name: controller.formEmail,
                      labelText: 'Email',
                      validator: FormBuilderValidators.compose(
                        [
                          FormValidatorsUtils.required,
                          FormValidatorsUtils.email,
                        ],
                      ),
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
                    CustomTextField(
                      name: controller.formPass,
                      labelText: 'Şifre',
                      isPassword: true,
                      validator: FormBuilderValidators.compose(
                        [
                          FormValidatorsUtils.required,
                          FormValidatorsUtils.minLength(6),
                        ],
                      ),
                    ),
                    const Gap(12),
                    CustomTextField(
                      name: controller.formPassAgain,
                      labelText: 'Şifre tekrar',
                      isPassword: true,
                      validator: FormBuilderValidators.compose(
                        [
                          FormValidatorsUtils.required,
                        ],
                      ),
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
                      items: const ['Erkek', 'Kadın'],
                      validator: FormValidatorsUtils.required,
                    ),
                  ],
                ),
              ),
              Gap(context.height * 0.05),
              ElevatedButton(
                onPressed: controller.register,
                child: const Text('Kayıt Ol'),
              ).customExt.infinityWidth,
              const Gap(24),
              Center(
                child: CustomRichText(
                  text: 'Hesabınız var mı? Giriş Yap',
                  color: ColorName.twNeutral400,
                  patternList: [
                    'Giriş Yap'.toRichTextPattern(
                      color: context.theme.colorScheme.primary,
                      onTap: () => Get.offNamed(Routes.LOGIN),
                    ),
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
