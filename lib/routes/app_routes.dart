import 'package:get/get.dart';
import 'package:test_project/modules/auth/forget_password_screen.dart';
import 'package:test_project/modules/auth/register_screen.dart';
import '../modules/auth/login_screen.dart';
import '../modules/splash/splash_screen.dart';

class Routes {
  static String routeSplash = '/';
  static String routeLogin = '/login';
  static String routeForgetPasword = '/forget-password';
  static String routeRegister = '/register';
}

appRoutes() => [
      /// splash
      GetPage(
        name: Routes.routeSplash,
        page: () => const SplashScreen(),
        transition: Transition.fade,
      ),

      /// login
      GetPage(
        name: Routes.routeLogin,
        page: () => const LoginScreen(),
        transition: Transition.fade,
      ),

      /// forget password
      GetPage(
        name: Routes.routeForgetPasword,
        page: () => const ForgetPasswordScreen(),
        transition: Transition.fade,
      ),

      /// forget password
      GetPage(
        name: Routes.routeRegister,
        page: () => const RegisterScreen(),
        transition: Transition.fade,
      ),
    ];
