import 'package:flutter/material.dart';
import 'package:nftappdesign/core/text_widget.dart';
import 'package:nftappdesign/globale.dart';

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({Key? key}) : super(key: key);

  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  int duration = 555;
  bool animatedPlay1 = false;
  bool animatedPlay2 = false;

  bool buttonAnimated = false;
  bool showButton = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        animatedPlay1 = true;
      });
    });

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          image(),
          button(),
          appBar(),
        ],
      )),
    );
  }

  Widget appBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      height: 70,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: colorStore.purpleColor,
        ),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            elevation: 0,
            primary: colorStore.purpleColor.withOpacity(0.1),
            minimumSize: const Size(65, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }

  Widget image() {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      alignment: const Alignment(0, -.2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset("assets/images/image.png"),
    );
  }

  Widget button() {
    return AnimatedContainer(
      onEnd: () {
        Future.delayed(const Duration(milliseconds: 111), () {
          setState(() {
            animatedPlay2 = true;
          });
        });
      },
      duration: Duration(milliseconds: (duration * 0.9).toInt()),
      alignment: Alignment(0, animatedPlay1 ? 0.9 : 0),
      // margin: EdgeInsets.only(
      //   left: animatedPlay1 ? 20 : deviceStore.width / 1.9,
      //   top:
      //       animatedPlay1 ? deviceStore.height - 150 : deviceStore.height / 1.9,
      //   bottom: animatedPlay1 ? 0 : deviceStore.height / 1.9,
      //   right: animatedPlay1 ? 20 : deviceStore.width / 1.9,
      // ),
      // height: 55,
      // width: animatedPlay ? deviceStore.width - 40 : 55,
      // decoration: BoxDecoration(
      // color: colorStore.purpleColor,
      // borderRadius: BorderRadius.circular(99),
      // ),
      child: showButton
          ? ElevatedButton(
              onPressed: () {},
              child: AnimatedContainer(
                  height: 55,
                  width: deviceStore.width - 100,
                  duration: const Duration(milliseconds: 222),
                  alignment: buttonAnimated
                      ? Alignment.center
                      : Alignment.bottomCenter,
                  child: textWidget("Truck Your Order", color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  minimumSize: Size(deviceStore.width - 40, 55)),
            )
          : AnimatedContainer(
              onEnd: () {
                Future.delayed(Duration(milliseconds: duration + 111), () {
                  setState(() {
                    showButton = true;
                  });
                });
                Future.delayed(Duration(milliseconds: duration + 155), () {
                  setState(() {
                    buttonAnimated = true;
                  });
                });
              },
              duration: Duration(milliseconds: duration ~/ 2),
              height: animatedPlay2
                  ? 55
                  : animatedPlay1
                      ? 55
                      : 5,
              width: animatedPlay2
                  ? deviceStore.width - 40
                  : animatedPlay1
                      ? 55
                      : 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: colorStore.purpleColor),
            ),
    );
  }
}
