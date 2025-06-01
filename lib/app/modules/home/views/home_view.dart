import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/data/model/calorie_model.dart';
import '../../../../common/data/service/calorie_service.dart';
import '../../../../common/gen/assets.gen.dart';
import '../../../../common/gen/colors.gen.dart';
import '../../../../core/extensions/stream_builder_extensions.dart';
import '../../../../core/widgets/custom_listvew_seperated.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CalorieService(controller.userStore.user.value?.id ?? '')
                  .listenCollection()
                  .customExt
                  .toBuild(
                    isEmptyOnSuccess: true,
                    onSuccess: (data) => Obx(
                      () => Column(
                        children: [
                          TableCalendar(
                            focusedDay: controller.selectedDate.value.isNotEmpty
                                ? DateTime.parse(
                                    controller.selectedDate.value,
                                  )
                                : DateTime.now(),
                            firstDay: DateTime(1990),
                            lastDay: DateTime(2050),
                            headerStyle:
                                const HeaderStyle(formatButtonVisible: false),
                            locale: 'tr_TR',
                            calendarFormat: CalendarFormat.week,
                            eventLoader: (date) => [
                              for (final item in data ?? <CalorieModel>[])
                                if (dateFormat.format(
                                      item.createdDate ?? DateTime.now(),
                                    ) ==
                                    dateFormat.format(date))
                                  item,
                            ],
                            selectedDayPredicate: (day) =>
                                DateFormat('yyyy-MM-dd').format(day) ==
                                controller.selectedDate.value,
                            onDaySelected: (selectedDay, focusedDay) {
                              if (controller.selectedDate.value.isNotEmpty &&
                                  DateFormat('yyyy-MM-dd')
                                          .format(selectedDay) ==
                                      controller.selectedDate.value) {
                                controller.selectedDate.value = '';
                              } else {
                                controller.selectedDate.value =
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDay);
                              }
                            },
                            calendarBuilders: CalendarBuilders(
                              selectedBuilder: (context, day, focusedDay) =>
                                  Center(
                                child: Wrap(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${day.day}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              todayBuilder: (context, day, focusedDay) =>
                                  Center(
                                child: Wrap(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${day.day}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              singleMarkerBuilder: (context, day, event) =>
                                  Container(
                                margin: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                width: 5,
                                height: 5,
                              ),
                            ),
                          ),
                          const Gap(8),
                          Row(
                            children: [
                              Text(
                                controller.selectedDate.value.isEmpty
                                    ? ''
                                    : 'Tarih: ${DateTime.parse(controller.selectedDate.value) == DateTime.parse(dateFormat.format(DateTime.now())) ? 'Bugün' : DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.selectedDate.value))}',
                                style: context.textTheme.titleMedium,
                              ),
                              // cancel
                              if (controller.selectedDate.value.isNotEmpty)
                                IconButton(
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    controller.selectedDate.value = '';
                                  },
                                ),
                            ],
                          ).paddingOnly(left: 16),
                          Builder(
                            builder: (context) {
                              final meal = data
                                  ?.toList()
                                  .where(
                                    (element) =>
                                        dateFormat.format(
                                          element.createdDate ?? DateTime.now(),
                                        ) ==
                                        controller.selectedDate.value,
                                  )
                                  .toList();
                              return !(meal?.isEmpty ?? true)
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorName.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 20,
                                            color: ColorName.twOrange300,
                                          ),
                                        ],
                                        border: Border.all(
                                          color: ColorName.twOrange400,
                                          width: 6,
                                        ),
                                      ),
                                      width: context.width * 0.3,
                                      height: context.width * 0.3,
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Assets.icons.calorie.svg(),
                                          ),
                                          const Gap(8),
                                          Text(
                                            NumberFormat.decimalPattern()
                                                .format(
                                              meal
                                                  ?.map((e) => e.calorie ?? 0)
                                                  .reduce(
                                                    (value, element) =>
                                                        value + element,
                                                  ),
                                            ),
                                            style: context.textTheme.titleLarge
                                                ?.copyWith(
                                              color: ColorName.twOrange400,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: ColorName.twBlue400,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.info,
                                            color: Colors.white,
                                          ),
                                          const Gap(8),
                                          Flexible(
                                            child: Text(
                                              controller.selectedDate.value
                                                      .isEmpty
                                                  ? 'Tüm öğünlerinizi görmek için takvimden bir tarih seçin.'
                                                  : meal?.isEmpty ?? true
                                                      ? 'Seçilen tarihe ait öğün bulunamadı.'
                                                      : 'Seçilen tarihe ait ${meal?.length} öğün bulunmaktadır.',
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: Colors.white,
                                              ),
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                          CustomListViewSeparated(
                            shrinkWrap: true,
                            data: controller.selectedDate.value.isEmpty
                                ? <CalorieModel>[]
                                : data
                                    ?.toList()
                                    .where(
                                      (element) =>
                                          dateFormat.format(
                                            element.createdDate ??
                                                DateTime.now(),
                                          ) ==
                                          controller.selectedDate.value,
                                    )
                                    .toList(),
                            itemBuilder: (context, item, index) => ListTile(
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Assets.icons.diet.svg(),
                              ),
                              title: Text(
                                '${item.name}',
                                style: context.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              trailing: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    '${item.calorie}',
                                    style:
                                        context.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Assets.icons.calorie.svg(),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                              subtitle: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: item.mealType == 'Kahvaltı'
                                          ? ColorName.twGreen200
                                          : item.mealType == 'Öğle Yemeği'
                                              ? ColorName.twBlue200
                                              : item.mealType == 'Akşam Yemeği'
                                                  ? ColorName.twOrange200
                                                  : ColorName.twRed200,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '${item.mealType ?? 'Kahvaltı'} ',
                                      style: context.textTheme.bodySmall,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    '${NumberFormat.decimalPattern().format(item.portion)} ${item.unit?.value}',
                                    style: context.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              dense: true,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              const SizedBox(height: 24),

              // Row in Vücut Kitle Endeksi - Yağ Oranı - Kalori Hesaplama

              const Gap(90),
            ],
          ),
        ),
      ),
    );
  }
}
