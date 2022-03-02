import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nftappdesign/core/text_widget.dart';
import 'package:nftappdesign/globale.dart';
import 'package:nftappdesign/pages/ItemDetailPage/item_detail_view.dart';
import 'package:nftappdesign/pages/MenuPage/menu_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
                child: Column(
              children: [appBar(), itemList()],
            )),
          ),
          const MenuPage(),
        ],
      ),
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
            onPressed: () {
              print("object;");
              menuStore.changeMenuOpen(false);
              menuStore.changeClosed(false);
              menuStore.changeMenuClosed(false);
              menuStore.changeMenuOpen(true);
            },
            child: textWidget("Menu",
                color: colorStore.purpleColor,
                fontWeight: FontWeight.w600,
                fontSize: 16),
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
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }

  Widget itemList() {
    Widget image({required int index}) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: const DecorationImage(
          //     image: AssetImage(
          //       "assets/images/image.png",
          //     ),
          //     fit: BoxFit.cover),
        ),
        height: deviceStore.height / 4.7,
        child: Hero(
          transitionOnUserGestures: false,
          tag: index,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/image.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget subtitle(
        {required String title,
        required String value,
        required String payType}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          textWidget(title,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: colorStore.greyColor),
          const Spacer(),
          textWidget(
            value,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: colorStore.greenColor,
          ),
          const SizedBox(width: 3),
          textWidget(payType,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: colorStore.greenColor,
              padding: const EdgeInsets.only(bottom: 2))
        ],
      );
    }

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, index) {
            return Stack(
              children: [
                Container(
                  height: deviceStore.height / 3.4,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12)
                      ]),
                  child: Column(
                    children: [
                      image(index: index),
                      const Spacer(flex: 3),
                      subtitle(title: "Strange", value: "26", payType: "ETH"),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ItemDetailPage(
                                    index: index,
                                  )));
                    },
                    child: Container(
                      height: deviceStore.height / 3.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            );
          }),
    );
  }
}
