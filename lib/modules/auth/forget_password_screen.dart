import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_project/controller/user/user_controller.dart';
import 'package:test_project/gen/assets.gen.dart';
import 'package:test_project/routes/app_routes.dart';
import 'package:test_project/utils/app_utils.dart';
import 'package:test_project/utils/constant.dart';
import 'package:test_project/widgets/button/form_input_button.dart';
import 'package:test_project/widgets/textfields/form_input_textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();
  var inputpassController = TextEditingController();

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


          /// gambar
          Positioned(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
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
                    Center(
                      child: Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: styleTitle.copyWith(
                          fontSize: setFontSize(90),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: setHeight(100),
                    ),

                    /// email or username
                    FormInputTexfield(
                      controller: emailController,
                      inputType: TextInputType.text,
                      secureText: false,
                      hint: 'Input Email',
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
                        controller: inputpassController,
                        inputType: TextInputType.visiblePassword,
                        secureText: _userController.hidePassword.value,
                        hint: 'Input New Password',
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
                      height: setHeight(120),
                    ),


                    FormInputButton(
                      text: 'Create New Password',
                      onClick: () {
                        AppUtils().snackbarShow(
                            message:
                            'Assalamualaikum😊😊😊 \nSelamat datang ${emailController
                                .text} 🙌🙌');
                        Get.toNamed(Routes.routeLogin);
                      },


                    ),

                    SizedBox(
                      height: setHeight(50),
                    ),

                  ],
                ),
              ),
            ),
          ),
                    
        ]
    ),
    );
  }
}
