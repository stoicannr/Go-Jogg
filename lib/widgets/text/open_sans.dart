import 'package:flutter/material.dart';

class OpenSans extends StatelessWidget {
  const OpenSans.bold({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.letterSpacing,
    this.textAlign,
    this.weight,
    this.lineHeight,
    this.textDecoration,
  }) : _fontFamily = "OpenSans-Bold", super(key: key);

  const OpenSans.italic({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.letterSpacing,
    this.textAlign,
    this.weight,
    this.lineHeight,
    this.textDecoration,
  }) : _fontFamily = "OpenSans-Italic", super(key: key);

  const OpenSans.regular({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.letterSpacing,
    this.textAlign,
    this.weight,
    this.lineHeight,
    this.textDecoration,
  }) : _fontFamily = "OpenSans-Regular", super(key: key);

  final String text;
  final double size;
  final Color? color;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final double? lineHeight;
  final TextDecoration? textDecoration;
  final String _fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        shadows: textDecoration == TextDecoration.underline ? [
          Shadow(
              color: color ?? Colors.black,
              offset: const Offset(0, -6))
        ] : null,
        decorationColor: color,
        height: lineHeight,
        fontFamily: _fontFamily,
        fontStyle: FontStyle.normal,
        color: textDecoration == TextDecoration.underline ?
          Colors.transparent :
          color ?? Colors.black,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterSpacing ?? 1,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
