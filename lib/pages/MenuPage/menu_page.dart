import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nftappdesign/core/text_widget.dart';
import 'package:nftappdesign/globale.dart';
import 'package:nftappdesign/pages/MenuPage/animated_button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    if (menuStore.menuClosed) {
      Future.delayed(const Duration(milliseconds: 333), () {
        menuStore.changeClosed(true);
        menuStore.changeMenuOpen(false);
      });
    }
    return Observer(builder: (_) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: AnimatedContainer(
          onEnd: () {
            Future.delayed(Duration(milliseconds: 111), () {
              setState(() {
                itemCount = 5;
              });
            });
          },
          duration: const Duration(milliseconds: 555),
          padding: EdgeInsets.only(top: menuStore.menuClosed ? 45 : 0),
          margin: EdgeInsets.only(
              top: menuStore.menuClosed ? 3 : 0,
              right: menuStore.closed ? deviceStore.width : 0),
          height: menuStore.menuOpen
              ? deviceStore.height
              : menuStore.closed
                  ? 0
                  : menuStore.menuClosed
                      ? 120
                      : 0,
          width: deviceStore.width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(menuStore.closed ? 99 : 0),
                topRight: Radius.circular(menuStore.closed ? 99 : 0),
              ),
              color: colorStore.purpleColor,
            ),
            child: SafeArea(
              child:
                  //  closed
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               menuStore.menuOpen = false;
                  //             },
                  //             child: textWidget(
                  //               "X",
                  //               fontSize: 22,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.white,
                  //             ),
                  //             style: ElevatedButton.styleFrom(
                  //                 shape: const CircleBorder(),
                  //                 minimumSize: const Size(50, 50),
                  //                 primary: Colors.black.withOpacity(0.65)),
                  //           ),
                  //         ],
                  //       )
                  //     :
                  Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !menuStore.closed
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                itemCount = 0;
                              });
                              menuStore.changeMenuOpen(false);
                            },
                            child: textWidget(
                              "X",
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                minimumSize: const Size(50, 50),
                                primary: Colors.black.withOpacity(0.65)),
                          )
                        : Padding(padding: EdgeInsets.zero),
                    const Spacer(),
                    !menuStore.closed
                        ? textWidget("Explore",
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w500)
                        : const Padding(padding: EdgeInsets.zero),
                    const Spacer(),
                    !menuStore.closed
                        ? ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 20);
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemCount,
                            itemBuilder: (BuildContext context, int index) {
                              return const AnimatedButton();
                            })
                        : const Padding(padding: EdgeInsets.zero),
                    const Spacer(flex: 7),
                    !menuStore.closed
                        ? ElevatedButton(
                            onPressed: () {},
                            child: textWidget(
                              "Filter & Sort",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(0.2),
                                elevation: 0,
                                shadowColor:
                                    colorStore.purpleColor.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22))),
                          )
                        : const Padding(padding: EdgeInsets.zero),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // Widget buttons() {
  //   bool animated = true;

  //   return AnimatedSize(
  //     duration: Duration(milliseconds: 222),
  //     child: ElevatedButton(
  //       onPressed: () {
  //         menuStore.changeMenuOpen(false);
  //         menuStore.changeMenuClosed(true);
  //       },
  //       child: Text("Art"),
  //       style: ElevatedButton.styleFrom(
  //           minimumSize: Size(deviceStore.width - 40, animated ? 55 : 0),
  //           side: const BorderSide(color: Colors.white, width: 0.5),
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10))),
  //     ),
  //   );
  // }
}
