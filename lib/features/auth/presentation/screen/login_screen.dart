import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/features/auth/presentation/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(LoginController());
    return Scaffold(
      backgroundColor: const Color(0xFF0096FC),
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Image.asset('assets/icons/loginicon.png', height: 98.h, width: 96.w),
          SizedBox(height: 20.h),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'SCUBE\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Control & Monitoring System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 80.h),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  // no fixed height: fill available vertical space from Expanded
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 32.h),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Txtfield(
                          hintText: 'Username',
                          controller: authC.usernameController,
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 12.h),
                        Txtfield(
                          hintText: 'Password',
                          controller: authC.passwordController,
                          obscureTextRx: authC.obscurePassword,
                          suffixIcon: Icons.visibility,
                        ).marginSymmetric(horizontal: 12.w),
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.w, top: 1.h),
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: () {
                            // Handle login action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0096FC),
                            padding: EdgeInsets.symmetric(
                              horizontal: 140.w,
                              vertical: 18.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Don’t have any account? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register Now',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF0096FC),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 200.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Txtfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final RxBool? obscureTextRx;
  final IconData? suffixIcon;
  final double? suffixIconSize;

  const Txtfield({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureTextRx,
    this.suffixIcon,
    this.suffixIconSize,
  });

  @override
  Widget build(BuildContext context) {
    // If there's an obscureTextRx provided we want the TextField to re-build
    // when it changes so we wrap the input in an Obx.
    Widget input = TextField(
      controller: controller,
      obscureText: obscureTextRx?.value ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 7.h),
      ),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );

    if (obscureTextRx != null) {
      input = Obx(
        () => TextField(
          controller: controller,
          obscureText: obscureTextRx!.value,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 7.h),
          ),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB9C6D6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: input),
          if (obscureTextRx != null)
            Obx(
              () => GestureDetector(
                onTap: () => obscureTextRx!.value = !obscureTextRx!.value,
                child: Icon(
                  // show eye / eye-off depending on state
                  obscureTextRx!.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Color(0xFF9AA9BD),
                ),
              ),
            )
          else if (suffixIcon != null)
            Icon(suffixIcon, color: Color(0xFF9AA9BD), size: suffixIconSize),
        ],
      ),
    );
  }
}
