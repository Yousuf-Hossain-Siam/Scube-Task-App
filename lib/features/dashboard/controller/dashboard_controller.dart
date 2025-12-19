import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Tab selection
  final selectedTabIndex = 0.obs;
  final tabs = ['Summery', 'SLD', 'Data'];

  // Source/Load toggle
  final isSourceSelected = true.obs;

  // Scroll state for DataCards
  final ScrollController dataCardsScrollController = ScrollController();
  final scrollPosition = 0.0.obs;
  final maxScrollExtent = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    dataCardsScrollController.addListener(_onScroll);
  }

  void _onScroll() {
    scrollPosition.value = dataCardsScrollController.position.pixels;
    maxScrollExtent.value = dataCardsScrollController.position.maxScrollExtent;
  }

  @override
  void onClose() {
    dataCardsScrollController.removeListener(_onScroll);
    dataCardsScrollController.dispose();
    super.onClose();
  }

  // Expandable sections
  final isDataViewExpanded = true.obs;
  final isDataType2Expanded = true.obs;
  final isDataType3Expanded = true.obs;

  // Data values
  final totalPower = 5.53.obs;

  // Data View items
  late final RxList<Map<String, String>> dataViewItems = RxList([
    {'label': 'Data 1', 'value': '55505.63'},
    {'label': 'Data 2', 'value': '58805.63'},
  ]);

  // Data Type 2 items
  late final RxList<Map<String, String>> dataType2Items = RxList([
    {'label': 'Data 1', 'value': '55505.63'},
    {'label': 'Data 2', 'value': '58805.63'},
  ]);

  // Data Type 3 items
  late final RxList<Map<String, String>> dataType3Items = RxList([
    {'label': 'Data 1', 'value': '55505.63'},
    {'label': 'Data 2', 'value': '58805.63'},
  ]);

  // Sections to render as a list
  List<Map<String, dynamic>> get sections => [
    {
      'img': 'assets/icons/solar-cell_5575136 1.png',
      'title': 'Data View',
      'boxColor': const Color(0xFF78C6FF),
      'actv': '(Active)',
      'actvColor': const Color(0xFF0096FC),
      'items': dataViewItems.toList(),
    },
    {
      'img': 'assets/icons/battery.png',
      'title': 'Data Type 2',
      'boxColor': const Color(0xFFFB902E),
      'actv': '(Active)',
      'actvColor': const Color(0xFF0096FC),
      'items': dataType2Items.toList(),
    },
    {
      'img': 'assets/icons/power.png',
      'title': 'Data Type 3',
      'boxColor': const Color(0xFF78C6FF),
      'actv': '(Inactive)',
      'actvColor': const Color(0xFFDF2222),
      'items': dataType3Items.toList(),
    },
  ];

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  void toggleSourceLoad(bool isSource) {
    isSourceSelected.value = isSource;
  }

  void toggleDataView() {
    isDataViewExpanded.value = !isDataViewExpanded.value;
  }

  void toggleDataType2() {
    isDataType2Expanded.value = !isDataType2Expanded.value;
  }

  void toggleDataType3() {
    isDataType3Expanded.value = !isDataType3Expanded.value;
  }
}
