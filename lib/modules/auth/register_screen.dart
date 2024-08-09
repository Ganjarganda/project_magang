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
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  final UserController _userController = Get.find();

  void checkNamaLengkap(String value) {
    if (value.isEmpty) {
      _userController.validNamaLengkap.value = false;
    } else {
      _userController.validNamaLengkap.value = true;
    }
  }
  
  void checkEmail(String value) {
    if (value.isEmpty) {
      _userController.validEmail.value = false;
    } else {
      _userController.validEmail.value = true;
    }
  }

  void checkPassword(String value) {
    if (value.isEmpty) {
      _userController.validPassword.value = false;
    } else {
      _userController.validPassword.value = true;
    }
  }

   void checkConfirmPass(String value) {
    if (value.isEmpty) {
      _userController.validConfimPass.value = false;
    } else {
      if(value == passwordController.text) {
        _userController.validConfimPass.value = true;
      } else {
        _userController.validConfimPass.value = false;
      }
    }
  }

  void checkSingUp() {
    checkNamaLengkap(namaController.text);
    checkEmail(emailController.text);
    checkPassword(passwordController.text);
    checkConfirmPass(confirmPassController.text);

    if (_userController.validNamaLengkap.value == true && _userController.validEmail.value == true &&
        _userController.validPassword.value == true && _userController.validConfimPass.value == true ) {
      AppUtils().snackbarShow(
        message:
            'Assalamualaikum😊😊😊 \nSelamat datang ${namaController.text} 🙌🙌',
      );
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Sign Up',
          style: styleTitle.copyWith(
            color: Colors.white,
            fontSize: setFontSize(48),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.imageBg1.path),
            fit: BoxFit.cover,
          ),
        ),
        child:  SingleChildScrollView(
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
                  height: setHeight(300),
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
                  controller: namaController,
                  inputType: TextInputType.text,
                  secureText: false,
                  hint: 'Nama Lengkap',
                  prefixIcon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                ),
                Obx(() {
                      if (_userController.validNamaLengkap.value == true) {
                        return const SizedBox();
                      } else {
                        return Text(
                          'Nama Lengkap Tidak Valid',
                          style: styleSubtitle.copyWith(color: Colors.white),
                        );
                      }
                    }),

                SizedBox(
                  height: setHeight(30),
                ),

                /// email or username
                FormInputTexfield(
                  controller: emailController,
                  inputType: TextInputType.text,
                  secureText: false,
                  hint: 'Email',
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),

                Obx(() {
                      if (_userController.validEmail.value == true) {
                        return const SizedBox();
                      } else {
                        return Text(
                          'email tidak valid',
                          style: styleSubtitle.copyWith(color: Colors.white),
                        );
                      }
                    }),

                SizedBox(
                  height: setHeight(30),
                ),

                /// password
                Obx(
                      () => FormInputTexfield(
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    secureText: _userController.hidePassword.value,
                    hint: 'Kata Sandi',
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

                Obx(() {
                      if (_userController.validPassword.value == true) {
                        return const SizedBox();
                      } else {
                        return Text(
                          'password tidak valid',
                          style: styleSubtitle.copyWith(color: Colors.white),
                        );
                      }
                    }),

                SizedBox(
                  height: setHeight(30),
                ),

                Obx(
                      () => FormInputTexfield(
                    controller: confirmPassController,
                    inputType: TextInputType.visiblePassword,
                    secureText: _userController.hidePassword.value,
                    hint: 'Konfirmasi Kata Sandi',
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

                Obx(() {
                      if (_userController.validConfimPass.value == true) {
                        return const SizedBox();
                      } else {
                        return Text(
                          'Konfirmasi Password Tidak Falid',
                          style: styleSubtitle.copyWith(color: Colors.white),
                        );
                      }
                    }),

                SizedBox(
                  height: setHeight(30),
                ),

                SizedBox(
                  height: setHeight(80),
                ),

                /// button sign in
                FormInputButton(
                  text: 'Sign Up',
                  onClick: () {
                    checkSingUp();
                  },
                ),

                SizedBox(
                  height: setHeight(50),
                ),

                /// button daftar
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.routeLogin,
                    );
                  },
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Sudah punya akun?',
                              style: styleSubtitle.copyWith(
                                fontSize: setFontSize(32),
                                color: Colors.white,
                              )),
                          TextSpan(
                              text: ' Login!',
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
    );
  }

/*@override
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
                      hint: 'Nama Lengkap',
                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: setHeight(50),
                    ),

                    /// email or username
                    FormInputTexfield(
                      controller: emailController,
                      inputType: TextInputType.text,
                      secureText: false,
                      hint: 'Email',
                      prefixIcon: const Icon(
                        Icons.mail,
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
                        hint: 'Kata Sandi',
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

                    Obx(
                      () => FormInputTexfield(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        secureText: _userController.hidePassword.value,
                        hint: 'Konfirmasi Kata Sandi',
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

                    SizedBox(
                      height: setHeight(80),
                    ),

                    /// button sign in
                    FormInputButton(
                      text: 'Sign Up',
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
                        Get.toNamed(
                          Routes.routeLogin,
                        );
                      },
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Sudah punya akun?',
                                  style: styleSubtitle.copyWith(
                                    fontSize: setFontSize(32),
                                    color: Colors.white,
                                  )),
                              TextSpan(
                                  text: ' Login!',
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
  }*/
}
