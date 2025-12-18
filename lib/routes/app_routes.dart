import 'package:scube_task_app/features/auth/presentation/screen/login_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";

  static String getLoginScreen() => loginScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
