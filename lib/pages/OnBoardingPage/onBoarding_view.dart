import 'package:flutter/material.dart';
import 'package:nftappdesign/core/button.dart';
import 'package:nftappdesign/core/text_widget.dart';
import 'package:nftappdesign/globale.dart';
import 'package:nftappdesign/pages/MainPage/main_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceStore.width = MediaQuery.of(context).size.width;
    deviceStore.height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: deviceStore.height / 1.6,
            color: Colors.red,
          ),
          const Spacer(),
          messageBox(
              title: "Dendy",
              message: "Buy, sell and collect NFTs on our Market"),
          const Spacer(flex: 2),
          button(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MainPage()));
              },
              child: textWidget("Let's go", color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 25)),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget messageBox({
    required String title,
    required String message,
  }) {
    return Column(
      children: [
        textWidget(title,
            fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black),
        const SizedBox(height: 22),
        textWidget(message,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 50))
      ],
    );
  }
}
