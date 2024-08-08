import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';

class SplashController extends GetxController {
  void next_activity() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.routeLogin);
    });
  }
}
