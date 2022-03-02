import 'package:flutter/material.dart';

Container textFormField(
    {TextEditingController? controller,
    required Map changeData,
    required String type,
    String hintText = "",
    String? text,
    TextStyle hintStyle =
        const TextStyle(color: Colors.white70, letterSpacing: 2.3),
    TextStyle textStyle =
        const TextStyle(color: Colors.white, letterSpacing: 1.2),
    bool autofocus = false,
    Color cursorColor = Colors.white}) {
  controller ??= TextEditingController(text: text != null ? text : "");
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 14),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.23),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white),
    ),
    child: Center(
        child: TextFormField(
      onChanged: (value) => changeData[type] = controller!.text.trim(),
      controller: controller,
      decoration: InputDecoration(hintText: hintText, hintStyle: hintStyle),
      style: textStyle,
      autofocus: autofocus,
      cursorColor: cursorColor,
    )),
  );
}
