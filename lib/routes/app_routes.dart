import 'package:scube_task_app/features/auth/presentation/screen/login_screen.dart';
import 'package:scube_task_app/features/dashboard/presentation/screen/dashboard_no_file.dart';
import 'package:scube_task_app/features/dashboard/presentation/screen/screen_1.dart';
import 'package:scube_task_app/features/dashboard/controller/screen_1_controller.dart';
import 'package:get/get.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String dashboardNoFile = "/dashboardNoFile";
  static String screen1 = "/screen1";

  static String getLoginScreen() => loginScreen;
  static String getDashboardNoFile() => dashboardNoFile;
  static String getScreen1() => screen1;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: dashboardNoFile, page: () => const DashboardNoFile()),
    GetPage(
      name: screen1,
      page: () => const Screen1(),
      binding: BindingsBuilder(() {
        Get.lazyPut<Screen1Controller>(() => Screen1Controller());
      }),
    ),
  ];
}
