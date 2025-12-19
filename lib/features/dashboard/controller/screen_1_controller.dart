import 'package:get/get.dart';

class Screen1Controller extends GetxController {
  var selectedOption = 'dataView'.obs;

  /// Second toggle (Today vs Custom Date)
  final selectedDateMode = 'today'.obs; // 'today' | 'custom'

  final dataValue = 55.00.obs;
  final revenueValue = 8897455.0.obs;

  final dataUnit = 'kWh/Sqft'.obs;
  final revenueUnit = 'tk'.obs;

  final dataProgress = 0.65.obs;
  final revenueProgress = 0.75.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void selectDateMode(String mode) {
    selectedDateMode.value = mode;
  }
}
