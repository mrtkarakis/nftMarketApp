import 'package:flutter/material.dart';
import 'package:nftappdesign/core/theme.dart';
import 'package:nftappdesign/pages/OnBoardingPage/onBoarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const OnBoardingPage(),
    );
  }
}
