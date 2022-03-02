import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

import 'background.dart';

Widget modal(
    {required BuildContext context, required Widget child, double? height}) {
  height = height == null ? deviceStore.height / 3.3 : height;
  return Align(
      alignment: const Alignment(0, 0.3),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: background(
                        height: height + 10,
                        width: deviceStore.width - 40,
                        opacity: 0.2,
                        child: Container()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: background(
                        height: height + 22,
                        width: deviceStore.width - 40,
                        opacity: 0.3,
                        child: Container()),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: background(
                    height: height,
                    width: deviceStore.width - 40,
                    opacity: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                          type: MaterialType.transparency, child: child),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1, -0.31),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/icons/closed_icon.png",
                      height: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ));
}
