import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Boilover-Regular",
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.zero,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  dividerColor: const Color(0xfff2f2f2),
  hintColor: const Color(0xffA9A9A9),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(375, 55),
        shape: const StadiumBorder(),
        primary: colorStore.purpleColor),
  ),
  textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white70, height: 1.2, fontSize: 15)),
  appBarTheme: const AppBarTheme(
      centerTitle: true, backgroundColor: Colors.transparent, elevation: 0),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.white.withOpacity(0.44),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
);

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
