import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

Image logo() {
  return Image.asset(
    "assets/logo/logo.png",
    height: deviceStore.width / 2.5,
    width: deviceStore.width / 2.5,
  );
}
