import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/features/dashboard/presentation/widgets/calender.dart';
import 'package:scube_task_app/features/dashboard/presentation/widgets/data_cost_info.dart';
import 'package:scube_task_app/features/dashboard/presentation/widgets/energy_card.dart';
import '../../controller/screen_1_controller.dart';

class Screen1 extends GetView<Screen1Controller> {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: [
            SizedBox(height: 40.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 15.h),
                      Obx(() {
                        final isDataView =
                            controller.selectedOption.value == 'dataView';
                        final value = isDataView
                            ? controller.dataValue.value
                            : controller.revenueValue.value;
                        final unit = isDataView
                            ? controller.dataUnit.value
                            : controller.revenueUnit.value;
                        final progress = isDataView
                            ? controller.dataProgress.value
                            : controller.revenueProgress.value;

                        return _CircularMetricChart(
                          valueText: isDataView
                              ? value.toStringAsFixed(2)
                              : value.toStringAsFixed(0),
                          unit: unit,
                          progress: progress,
                        );
                      }),

                      SizedBox(height: 100.h),
                      Obx(
                        () => controller.selectedOption.value == 'revenueView'
                            ? Column(
                                children: [
                                  DataCostInfo().marginSymmetric(
                                    horizontal: 24.w,
                                  ),
                                  SizedBox(height: 390.h),
                                ],
                              )
                            : SizedBox.shrink(),
                      ),
                      Obx(
                        () => controller.selectedOption.value == 'dataView'
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 56.w,
                                    ),
                                    child: Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _ToggleItem(
                                            label: 'Today Data',
                                            selected:
                                                controller
                                                    .selectedDateMode
                                                    .value ==
                                                'today',
                                            onTap: () => controller
                                                .selectDateMode('today'),
                                          ),
                                          _ToggleItem(
                                            label: 'Custom Date Data',
                                            selected:
                                                controller
                                                    .selectedDateMode
                                                    .value ==
                                                'custom',
                                            onTap: () => controller
                                                .selectDateMode('custom'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  if (controller.selectedDateMode.value ==
                                      'custom')
                                    Calender().marginSymmetric(
                                      horizontal: 31.w,
                                    ),
                                  Obx(() {
                                    final isCustom =
                                        controller.selectedDateMode.value ==
                                        'custom';
                                    final isToday =
                                        controller.selectedDateMode.value ==
                                        'today';

                                    return Column(
                                      children: [
                                        SizedBox(height: 20.h),
                                        if (isCustom)
                                          EnergyCard(
                                            value: '20.05 kw',
                                          ).marginSymmetric(horizontal: 24.w),
                                        if (isCustom) SizedBox(height: 20.h),
                                        if (isToday || isCustom)
                                          EnergyCard().marginSymmetric(
                                            horizontal: 24.w,
                                          ),
                                        SizedBox(height: 130.h),
                                      ],
                                    );
                                  }),
                                ],
                              )
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  top: -20,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFA5A7B9)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _ToggleItem(
                              label: 'Data View',
                              selected:
                                  controller.selectedOption.value == 'dataView',
                              onTap: () => controller.selectOption('dataView'),
                            ),
                            _ToggleItem(
                              label: 'Revenue View',
                              selected:
                                  controller.selectedOption.value ==
                                  'revenueView',
                              onTap: () =>
                                  controller.selectOption('revenueView'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleItem extends StatelessWidget {
  const _ToggleItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF007AFF) : Color(0xFF646984);
    final icon = selected
        ? Icons.radio_button_checked
        : Icons.radio_button_unchecked;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularMetricChart extends StatelessWidget {
  const _CircularMetricChart({
    required this.valueText,
    required this.unit,
    required this.progress,
  });

  final String valueText;
  final String unit;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      height: 130.h,
      child: CustomPaint(
        painter: _CircularProgressPainter(
          progress: progress,
          backgroundColor: const Color(0xFF55B4FF).withValues(alpha: .15),
          strokeWidth: 20,
        ),
        child: Align(
          // Gauge arc uses a circle center at the bottom, so we nudge text down.
          alignment: const Alignment(0, 1.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valueText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  _CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color backgroundColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // Gauge-style: move circle center to bottom so only top arc is visible.
    final center = Offset(size.width / 2, size.height);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    const startAngle = 3.141592653589793 * 0.75; // 135°
    const totalSweep = 3.141592653589793 * 1.5; // 270° (open bottom)

    // Background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep,
      false,
      backgroundPaint,
    );

    final progressPaint = Paint()
      ..color = const Color(0xFF4E91FD)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = totalSweep * progress.clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
