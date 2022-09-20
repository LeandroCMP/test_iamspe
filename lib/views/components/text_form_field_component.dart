import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final double height;
  final double width;
  final double fontSize;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final Color backgroundColor;
  final Color labelColor;
  final FontWeight fontWeight;
  final bool obscureText;
  final bool hasIcon;
  final Function? onPressed;
  final bool? readOnly;
  const TextFormFieldComponent({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.backgroundColor,
    required this.labelColor,
    required this.fontWeight,
    required this.obscureText,
    required this.hasIcon,
    this.readOnly,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(08),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            suffixIcon: hasIcon == false
                ? null
                : IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => onPressed!(),
                  ),
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: fontSize,
              color: labelColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
