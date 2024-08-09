import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/services/storage/user/event_user.dart';

class SplashController extends GetxController {
  void next_activity() {

    int user_id = EventUser.getUserId();

    if(user_id > 0) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.routesBerandaScreen);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(Routes.routeLogin);
      });
    }

  }
}
