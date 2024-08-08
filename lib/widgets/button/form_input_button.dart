import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class FormInputButton extends StatelessWidget {
  final String text;
  final Function onClick;

  const FormInputButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick(),
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: setHeight(30),
              horizontal: setWidth(30),
            ),
            child: Center(
              child: Text(
                text,
                style: styleTitle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
