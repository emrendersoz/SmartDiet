import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/store/index.dart';

class HomeController extends GetxController {
  final userStore = UserStore.to;
  final Rx<String> selectedDate = ''.obs;

  @override
  void onInit() {
    selectedDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.onInit();
  }
}
