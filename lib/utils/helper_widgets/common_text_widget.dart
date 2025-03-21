import 'package:flutter/material.dart';

class CommonTextWidgets {
  textOutfit({
    required String text,
    required double size,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxlines,
    bool? softWrap,
    TextOverflow? overflow,
    double? letterSpacing,
    String? family = "outfit",
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return Text(
      maxLines: maxlines,
      overflow: overflow,
      softWrap: softWrap,
      text,
      style: TextStyle(
          fontSize: size,
          color: color ?? Colors.black,
          letterSpacing: letterSpacing,
          fontFamily: family,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: decorationColor ?? Colors.black),
      textAlign: textAlign,
    );
  }
}

