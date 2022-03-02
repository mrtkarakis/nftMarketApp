import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'color_store.g.dart';

class ColorStore = _ColorStoreBase with _$ColorStore;

abstract class _ColorStoreBase with Store {
  final Color disabledGreyColor = const Color(0XFFDBDBDB);
  final Color purpleColor = const Color(0xff5634CD);
  final Color greyColor = const Color.fromARGB(255, 169, 198, 200);
  final Color greenColor = Color.fromARGB(255, 82, 171, 82);

  final Color borderWhite = const Color(0xffC5FFBD);

  final Color primaryGreenColor = const Color(0XFF9FDE93);
  final List<Color> backgroundGradient = [
    const Color(0XFFD6977E),
    const Color(0XFF8785DB),
  ];
}
