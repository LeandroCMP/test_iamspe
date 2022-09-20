import 'package:flutter/material.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/loading_component.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final Color color;
  final TextComponent text;
  final bool loadingLogin;
  final Color? colorLoading;
  const ElevatedButtonComponent({
    Key? key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.loadingLogin,
    this.colorLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: loadingLogin == false
          ? TextComponent(
              text: text.text,
              fontSize: text.fontSize,
              fontWeight: text.fontWeight,
              textColor: text.textColor,
            )
          : LoadingComponent(
              isLoading: loadingLogin,
              child: null,
              color: colorLoading,
            ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width,
          height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(08),
        ),
        primary: color,
      ),
    );
  }
}
