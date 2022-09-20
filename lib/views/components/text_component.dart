import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;

  const TextComponent({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 12,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
