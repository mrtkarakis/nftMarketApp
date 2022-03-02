import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nftappdesign/globale.dart';

Container appBar(
    {required BuildContext context,
    double iconSize = 25,
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w900,
    String title = "",
    double topPadding = 0,
    bool heightLimit = true,
    bool button = true}) {
  return Container(
    height: heightLimit
        ? (deviceStore.height / (Platform.isIOS ? 8.6 : 9.2)) + topPadding
        : null,
    padding: EdgeInsets.only(top: topPadding),
    child: Observer(
      builder: (_) {
        return AppBar(
          leading: button
              ? TextButton(
                  child: SvgPicture.asset(
                    "assets/icons/back_button.svg",
                    height: iconSize,
                    color:
                        Colors.white.withOpacity(globalStore.loading ? .53 : 1),
                  ),
                  onPressed:
                      globalStore.loading ? null : () => Navigator.pop(context),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(
                fontFamily: "Boilover-Black",
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: 1.85),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
      },
    ),
  );
}
