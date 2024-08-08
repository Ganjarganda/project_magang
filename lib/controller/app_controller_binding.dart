import 'package:get/get.dart';
import 'package:test_project/controller/splash/splash_controller.dart';
import 'package:test_project/controller/user/user_controller.dart';

class AppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(UserController());
  }

}
