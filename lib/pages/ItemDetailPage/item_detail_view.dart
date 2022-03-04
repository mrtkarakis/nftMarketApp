import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nftappdesign/core/text_widget.dart';
import 'package:nftappdesign/globale.dart';
import 'package:nftappdesign/pages/ItemDetailPage/BuyNowPage/buy_now_view.dart';

class ItemDetailPage extends StatefulWidget {
  int index;
  int value;
  ItemDetailPage({Key? key, required this.index, required this.value})
      : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool animatedPlay = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 350), () {
      setState(() {
        animatedPlay = true;
      });
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          SizedBox(height: deviceStore.height / 100),
          image(),
          SizedBox(height: deviceStore.height / 100),
          subtitle(
              type: menuStore.selectType,
              value: widget.value.toString(),
              payType: "ETH"),
          description(
              title: menuStore.selectType,
              message:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
          const Spacer(flex: 1),
          Row(
            children: [
              const Spacer(flex: 2),
              button(isBuy: true),
              const Spacer(),
              button(isBuy: false),
              const Spacer(flex: 2),
            ],
          ),
          const Spacer(),
        ],
      )),
    );
  }

  Widget appBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
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
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget image() {
    return Center(
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 777),
        height: deviceStore.height / (animatedPlay ? 2.2 : 3.4),
        width: deviceStore.width - (animatedPlay ? 40 : 88),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: const DecorationImage(
          //     image: AssetImage(
          //       "assets/images/image.png",
          //     ),
          //     fit: BoxFit.cover),
        ),
        child: Hero(
          tag: widget.index,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/${menuStore.selectType.toLowerCase()}_${widget.index}.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget subtitle(
      {required String type, required String value, required String payType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 25,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.orange.withOpacity(0.1),
            ),
            child: textWidget(type, color: Colors.orange),
          ),
          const Spacer(),
          textWidget(
            value,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: colorStore.greenColor,
          ),
          const SizedBox(width: 5),
          textWidget(payType,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: colorStore.greenColor,
              padding: const EdgeInsets.only(bottom: 2))
        ],
      ),
    );
  }

  Widget description({required String title, required String message}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        textWidget(title, fontSize: 36, fontWeight: FontWeight.w800),
        const SizedBox(height: 3),
        SizedBox(
          height: deviceStore.height / 8,
          child: textWidget(message,
              fontSize: deviceStore.height / 51,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              textAlign: TextAlign.start),
        ),
      ]),
    );
  }

  Widget button({required bool isBuy}) {
    return ElevatedButton(
      onPressed: () {
        if (isBuy) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BuyNowPage(
                        index: widget.index,
                      )));
        }
      },
      child: textWidget(isBuy ? "Buy now" : "Bid",
          color: isBuy ? Colors.white : colorStore.purpleColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.7),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          primary:
              isBuy ? colorStore.purpleColor : Colors.grey.withOpacity(0.08),
          minimumSize: Size(deviceStore.width / 2.5, 55)),
    );
  }
}
