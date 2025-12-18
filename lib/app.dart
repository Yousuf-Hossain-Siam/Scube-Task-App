import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'routes/app_routes.dart';

class ScubeTaskApp extends StatelessWidget {
  const ScubeTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 836),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.getLoginScreen(),
          getPages: AppRoute.routes,
          // removed initialBinding (ControllerBinder) which wasn't present in the project
          themeMode: ThemeMode.system,
          theme: ThemeData.light(),
       
        );
      },
    );
  }
}
