import 'package:get/get.dart';
import 'package:test_project/modules/beranda/beranda_screen.dart';
import 'package:test_project/modules/auth/forget_password_screen.dart';
import 'package:test_project/modules/auth/register_screen.dart';
<<<<<<< Updated upstream
import 'package:test_project/modules/informasi/informasi_screen.dart';
=======
import 'package:test_project/modules/livechat/livechat_screen.dart';
>>>>>>> Stashed changes
import '../modules/auth/login_screen.dart';
import '../modules/splash/splash_screen.dart';

class Routes {
  static String routeSplash = '/';
  static String routeLogin = '/login';
  static String routeForgetPasword = '/forget-password';
  static String routeRegister = '/register';
  static String routesBerandaScreen = '/beranda_screen';
<<<<<<< Updated upstream
  static String routesInformasi = '/informasi';
=======
  static String routeLiveChat = '/livechat_screen';
>>>>>>> Stashed changes
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
        transition: Transition.fadeIn,
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

      /// Beranda Screen
      GetPage(
        name: Routes.routesBerandaScreen,
        page: () => BerandaScreen(),
        transition: Transition.rightToLeftWithFade,
      ),
  
      /// informasi
      GetPage(
        name: Routes.routesInformasi,
        page: () => InformasiScreen(),
        transition: Transition.fade,
      ),
<<<<<<< Updated upstream
  
=======

      /// live chat
      GetPage(
        name: Routes.routeLiveChat,
        page: () => const LivechatScreen(),
        transition: Transition.fade,
      ),
>>>>>>> Stashed changes
    ];
