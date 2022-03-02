import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

Padding textWidget(String text,
    {String fontFamily = "Boilover-Regular",
    EdgeInsets padding = EdgeInsets.zero,
    bool withZero = false,
    // bool translate = true,
    double fontSize = 14,
    double letterSpacing = 0,
    double height = 1.4,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black87}) {
  if (withZero) {
    text = text.length == 1 ? "0$text" : text;
  }
  // if (translate) {
  //   text = text.tr();
  // }
  return Padding(
    padding: padding,
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
    ),
  );
}

SizedBox messageBox({
  required String message,
  double width = 200,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w600,
  double letterSpacing = 1.3,
  TextAlign textAlign = TextAlign.center,
  String fontFamily = "Boilover-Regular",
}) {
  return SizedBox(
    width: width,
    child: textWidget(
      message,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      textAlign: textAlign,
    ),
  );
}
