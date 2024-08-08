import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class FormInputTexfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final bool secureText;

  const FormInputTexfield({
    super.key,
    required this.controller,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.inputType,
    required this.secureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: secureText,
      textInputAction: TextInputAction.done,
      style: styleSubtitle.copyWith(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: styleSubtitle.copyWith(
          color: Colors.grey,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: setWidth(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: setWidth(5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: setWidth(5),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
            width: setWidth(5),
          ),
        ),
      ),
    );
  }
}
