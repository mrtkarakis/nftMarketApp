import 'package:flutter/material.dart';

Widget button({
  required VoidCallback? onPressed,
  required Widget child,
  EdgeInsets padding = EdgeInsets.zero,
}) {
  return Padding(
    padding: padding,
    child: ElevatedButton(
      onPressed: onPressed,
      child: child,
    ),
  );
}
