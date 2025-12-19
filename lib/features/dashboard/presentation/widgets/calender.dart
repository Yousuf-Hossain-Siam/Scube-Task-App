import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 127.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: const Color(0xFFA5A7B9)),
          ),
          child: Row(
            children: [
              Text(
                'From Date',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF646984),
                ),
              ),
              Spacer(),
              Icon(Icons.calendar_month, color: Color(0xFF646984), size: 18.h),
            ],
          ).marginSymmetric(horizontal: 8.w, vertical: 10.h),
        ),
        SizedBox(width: 4.w),
         Container(
          width: 127.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: const Color(0xFFA5A7B9)),
          ),
          child: Row(
            children: [
              Text(
                'To Date',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF646984),
                ),
              ),
              Spacer(),
              Icon(Icons.calendar_month, color: Color(0xFF646984), size: 18.h),
            ],
          ).marginSymmetric(horizontal: 8.w, vertical: 10.h),
        ),
 SizedBox(width: 4.w,),
 Container(
  height: 36.h,
  width: 34.w,
  decoration: BoxDecoration(
    color: Color(0xFFE2EBF1),
    border: Border.all(color: Color(0xFF0096FC)),
    borderRadius: BorderRadius.circular(6.r),
  ),
  child: Icon(Icons.search, size: 18.h, color: Color(0xFF0096FC)),
 )
      ],
    );
  }
}
