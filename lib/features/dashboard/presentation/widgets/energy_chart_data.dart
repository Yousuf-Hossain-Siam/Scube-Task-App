import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class EnergyChartData extends StatelessWidget {
  final Color datacolor;
  final String data;
  final String datavalue;
  final String costvalue;
  const EnergyChartData({
    super.key,
    required this.datacolor,
    required this.data,
    required this.datavalue,
    required this.costvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA5A7B9)),

        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: datacolor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                data,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ).marginOnly(left: 4.w, top: 8.h, bottom: 4),
          Container(
            width: 1,
            height: 30.h,
            color: Colors.black.withOpacity(0.3),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Data    :  ',
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
                      text: 'Cost    :  ',
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
          ),
        ],
      ),
    );
  }
}
