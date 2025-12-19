import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/features/dashboard/controller/dashboard_controller.dart';
import 'package:scube_task_app/routes/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _buildChip(String imagePath, String label) {
    return GestureDetector(
      onTap: () async {
        try {
          await Get.toNamed(AppRoute.dashboardNoFile);
        } catch (e, st) {
          debugPrint('Navigation error to DashboardNoFile: $e');
          debugPrintStack(stackTrace: st);
          Get.snackbar('Navigation Error', e.toString());
        }
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFA5A7B9)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 24.h, width: 24.w),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF646984),
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 9, vertical: 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: const Color(0xFFD9E4F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SCM',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black54,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 15,
                top: 15,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Tab Bar
                  Obx(
                    () => Row(
                      children: List.generate(
                        controller.tabs.length,
                        (index) => Expanded(
                          child: GestureDetector(
                            onTap: () => controller.selectTab(index),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedTabIndex.value == index
                                    ? const Color(0xFF2196F3)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                controller.tabs[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      controller.selectedTabIndex.value == index
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1.h, color: Color(0xFFA5A7B9)),
                  SizedBox(height: 12.h),
                  // Electricity Title
                  Text(
                    'Electricity',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF979797),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(
                    height: 2.h,
                    thickness: 2,
                    color: Color(0xFFA5A7B9),
                  ).marginSymmetric(horizontal: 8),
                  // Circular Power Indicator
                  SizedBox(height: 14.h),
                  Obx(
                    () => Container(
                      width: 150.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF398FC9),
                          width: 20.w,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Power',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '${controller.totalPower.value} kw',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Source/Load Toggle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Color(0x336C99B8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.toggleSourceLoad(true),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  decoration: BoxDecoration(
                                    color: controller.isSourceSelected.value
                                        ? const Color(0xFF0096FC)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    'Source',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: controller.isSourceSelected.value
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.toggleSourceLoad(false),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  decoration: BoxDecoration(
                                    color: !controller.isSourceSelected.value
                                        ? const Color(0xFF0096FC)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    'Load',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: !controller.isSourceSelected.value
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Divider(
                    height: 2.h,
                    thickness: 2,
                    color: Color(0xFFA5A7B9),
                  ).marginSymmetric(horizontal: 8),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 270.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: ScrollableDataCards(
                            sections: controller.sections,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ).marginSymmetric(horizontal: 24.w),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Wrap(
                spacing: 16.w,
                runSpacing: 8.h,
                children: [
                  _buildChip('assets/icons/chart_490605.png', 'Analysis Pro'),
                  _buildChip(
                    'assets/icons/generator_8789846.png',
                    'G. Generator',
                  ),
                  _buildChip(
                    'assets/icons/charge_7345374 1.png',
                    'Plant Summary',
                  ),
                  _buildChip('assets/icons/fire_3900509 1.png', 'Natural Gas'),
                  _buildChip(
                    'assets/icons/generator_8789846.png',
                    'D. Generator',
                  ),
                  _buildChip(
                    'assets/icons/faucet_1078798.png',
                    'Water Process',
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class ScrollableDataCards extends StatelessWidget {
  final List<Map<String, dynamic>> sections;
  const ScrollableDataCards({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final trackHeight = 187.h;
    final thumbHeight = 40.h;
    final scrollableRange = trackHeight - thumbHeight;

    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: controller.dataCardsScrollController,
            child: Column(
              children: sections
                  .map(
                    (s) => DataCard(
                      img: s['img'] as String,
                      title: s['title'] as String,
                      boxColor: s['boxColor'] as Color,
                      actv: s['actv'] as String,
                      actvColor: s['actvColor'] as Color,
                      items: List<Map<String, String>>.from(s['items'] as List),
                    ).marginOnly(left: 12.w).marginOnly(bottom: 8.h),
                  )
                  .toList(),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
          height: trackHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Track
              Container(
                width: 4.w,
                height: trackHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFFB6B8D0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Thumb
              Obx(() {
                final thumbPosition = controller.maxScrollExtent.value > 0
                    ? (controller.scrollPosition.value /
                              controller.maxScrollExtent.value) *
                          scrollableRange
                    : 0.0;
                return Positioned(
                  top: thumbPosition,
                  child: Container(
                    width: 5.w,
                    height: thumbHeight,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4E91FD), Color(0xFF080B7F)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class DataCard extends StatelessWidget {
  final String img;
  final String title;
  final Color boxColor;
  final String actv;
  final Color actvColor;
  final List<Map<String, String>> items;
  const DataCard({
    super.key,
    required this.img,
    required this.title,
    required this.boxColor,
    required this.actv,
    required this.actvColor,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE5F4FE),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFFA5A7B9)),
      ),
      child: Row(
        children: [
          Image.asset(img, height: 24.h, width: 24.w),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: boxColor,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Text(
                    actv,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: actvColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // Render items as a list (keeps the UI same but driven from data)
              ...items.map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Text.rich(
                    TextSpan(
                      text: '${item['label']} ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF5B5B5B),
                      ),
                      children: [
                        TextSpan(
                          text: ': ${item['value']}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF04063E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              try {
                await Get.toNamed(AppRoute.screen1);
              } catch (e, st) {
                debugPrint('Navigation error to Screen1: $e');
                debugPrintStack(stackTrace: st);
                Get.snackbar('Navigation Error', e.toString());
              }
            },
            child: Icon(
              Icons.chevron_right,
              color: const Color(0xFF646984),
              size: 34.h,
            ),
          ),
        ],
      ).marginAll(8),
    );
  }
}
