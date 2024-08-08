import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/user/user_controller.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/utils/app_utils.dart';
import 'package:test_project/utils/constant.dart';
import 'package:test_project/widgets/button/form_input_button.dart';
import 'package:test_project/widgets/textfields/form_input_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// gambar
          Positioned(
            child: Image.asset(
              Assets.images.imageBg1.path,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),

          /// form
          Positioned(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: setWidth(60),
                  vertical: setHeight(60),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: setHeight(500),
                    ),

                    /// sign in
                    Text(
                      'Sign Up',
                      style: styleTitle.copyWith(
                        fontSize: setFontSize(100),
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: setHeight(50),
                    ),

                    /// email or username
                    FormInputTexfield(
                      controller: usernameController,
                      inputType: TextInputType.text,
                      secureText: false,
                      hint: 'Nama',
                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: setHeight(30),
                    ),

                    /// password
                    Obx(
                      () => FormInputTexfield(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        secureText: _userController.hidePassword.value,
                        hint: 'Password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _userController.hidePassword.value =
                                !_userController.hidePassword.value;
                          },
                          icon: Icon(
                            _userController.hidePassword.value == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: setHeight(30),
                    ),

                    /// forget password
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.routeForgetPasword);
                        },
                        child: Text(
                          'Forget Password',
                          style: styleTitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: setHeight(80),
                    ),

                    /// button sign in
                    FormInputButton(
                      text: 'Sign In',
                      onClick: () {
                        AppUtils().snackbarShow(
                          message:
                              'Email : ${usernameController.text} , Pass : ${passwordController.text}',
                        );
                      },
                    ),

                    SizedBox(
                      height: setHeight(50),
                    ),

                    /// button daftar
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.routeRegister);
                      },
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Belum punya akun?',
                                  style: styleSubtitle.copyWith(
                                    fontSize: setFontSize(32),
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: ' Daftar',
                                  style: styleTitle.copyWith(
                                      fontSize: setFontSize(32),
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: setHeight(50),
                    ),

                    ///button informasi
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
