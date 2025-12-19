import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class DataCostInfoController extends GetxController {
  final isExpanded = true.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}

class DataCostInfo extends StatelessWidget {
  DataCostInfo({super.key});

  final controller = DataCostInfoController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataCostInfoController>(
      init: DataCostInfoController(),
      builder: (controller) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFA5A7B9)),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFA5A7B9)),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/chart.png',
                    height: 18.h,
                    width: 18.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Data & Cost Info',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: controller.toggleExpanded,
                    child: Obx(
                      () => Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0096FC),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            controller.isExpanded.value
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 12.w, vertical: 9.h),
            ),
            Obx(
              () => controller.isExpanded.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        DataValue(
                          datanum: 'Data 1',
                          costnum: 'Cost 1 ',
                          datavalue: '  : 2798.50 (29.53%)',
                          costvalue: ' : 35689 ৳',
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 12.h),
                        DataValue(
                          datanum: 'Data 2',
                          costnum: 'Cost 2 ',
                          datavalue: '  : 2798.50 (29.53%)',
                          costvalue: ' : 35689 ৳',
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 12.h),
                        DataValue(
                          datanum: 'Data 3',
                          costnum: 'Cost 3 ',
                          datavalue: '  : 2798.50 (29.53%)',
                          costvalue: ' : 35689 ৳',
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 12.h),
                        DataValue(
                          datanum: 'Data 4',
                          costnum: 'Cost 4 ',
                          datavalue: '  : 2798.50 (29.53%)',
                          costvalue: ' : 35689 ৳',
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 12.h),
                      ],
                    )
                  : SizedBox(height: 12.h),
            ),
          ],
        ),
      ),
    );
  }
}

class DataValue extends StatelessWidget {
  final String datanum;
  final String costnum;
  final String datavalue;
  final String costvalue;
  const DataValue({
    super.key,
    required this.datanum,
    required this.costnum,
    required this.datavalue,
    required this.costvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: datanum,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF646984),
                ),
              ),
              TextSpan(
                text: datavalue,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: costnum,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF646984),
                ),
              ),
              TextSpan(
                text: costvalue,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
