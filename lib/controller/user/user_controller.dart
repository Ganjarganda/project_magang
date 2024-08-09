import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/services/storage/user/event_user.dart';
import 'package:test_project/utils/app_utils.dart';
import 'package:http/http.dart' as https;

import '../../services/api/api.dart';

class UserController extends GetxController {
  RxBool hidePassword = true.obs;

  RxBool validNamaLengkap = true.obs;
  RxBool validEmail = true.obs;
  RxBool validPassword = true.obs;
  RxBool validConfimPass = true.obs;

  /// api login
  void login({
    required String email,
    required String password,
  }) async {
    EasyLoading.show(status: 'loading');
    try {
      var response = await https.post(
        Uri.parse(Api().url_login),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      var rspBody = jsonDecode(response.body);
      if (rspBody['status'] == 1) {
        int id = rspBody['data']['id'] ?? 0;
        String nama = rspBody['data']['nama'] ?? '';
        String email = rspBody['data']['email'] ?? '';

        AppUtils().snackbarShow(message: 'Selamat Datang $nama');

        EventUser().saveUserId(id);

        Get.toNamed(Routes.routesBerandaScreen);
      } else {
        AppUtils().snackbarShow(message: rspBody['message']);
      }

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      AppUtils().snackbarShow(message: e.toString());
    }
  }

  /// api login
  void register({
    required String nama,
    required String email,
    required String password,
  }) async {
    EasyLoading.show(status: 'loading');
    try {
      var response = await https.post(
        Uri.parse(Api().url_register),
        body: jsonEncode({
          'nama': nama,
          'email': email,
          'password': password,
        }),
      );

      var rspBody = jsonDecode(response.body);

      if (rspBody['status'] == 1) {
        AppUtils().snackbarShow(message: rspBody['message']);
      } else {
        AppUtils().snackbarShow(message: rspBody['message']);
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      AppUtils().snackbarShow(message: e.toString());
    }
  }
}
