import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

Container background({
  required Widget child,
  double height = 0,
  double width = 0,
  double opacity = 1,
}) {
  if (height == 0) {
    height = deviceStore.height;
  }

  if (width == 0) {
    width = deviceStore.width;
  }
  return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0XFFD6977E).withOpacity(opacity),
            const Color(0XFF8785DB).withOpacity(opacity),
          ],
        ),
      ),
      child: child);
}
