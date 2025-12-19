import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:scube_task_app/features/dashboard/presentation/widgets/energy_chart_data.dart';

class EnergyCard extends StatelessWidget {
  final String? value;
  const EnergyCard({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFA5A7B9)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Energy Chart',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                value ?? '5.53 kw',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ).marginSymmetric(horizontal: 33.w, vertical: 20.h),
          EnergyChartData(
            datacolor: Color(0xFF0096FC),
            data: 'Data A',
            datavalue: '2798.50 (29.53%)',
            costvalue: '35689 ৳',
          ).marginSymmetric(horizontal: 8.w),
          SizedBox(height: 4.h),
          EnergyChartData(
            datacolor: Color(0xFF7BD7FF),
            data: 'Data B',
            datavalue: '72598.50 (35.39%)',
            costvalue: '5259689 ৳',
          ).marginSymmetric(horizontal: 8.w),
          SizedBox(height: 4.h),
          EnergyChartData(
            datacolor: Color(0xFF9747FF),
            data: 'Data C',
            datavalue: '6598.36 (83.90%)',
            costvalue: '5698756 ৳',
          ).marginSymmetric(horizontal: 8.w),
          SizedBox(height: 4.h),
          EnergyChartData(
            datacolor: Color(0xFFFF9A00),
            data: 'Data D',
            datavalue: '6598.26 (36.59%)',
            costvalue: '356987 ৳',
          ).marginSymmetric(horizontal: 8.w),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
