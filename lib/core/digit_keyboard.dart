import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nftappdesign/globale.dart';

class DigitKeyboard extends StatelessWidget {
  // final TextEditingController controller;
  final String? type;
  final Map? changeData;
  final bool enable;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const DigitKeyboard({
    Key? key,
    // required this.controller,
    this.type,
    this.changeData,
    this.enable = true,
    this.width = 0,
    this.height = 300,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return digitKeyboard(
        type: type,
        changeData: changeData,
        // controller: controller,
        enable: enable,
        height: height,
        margin: margin,
        width: width,
        padding: padding);
  }

  Container digitKeyboard({
    // required TextEditingController controller,
    String? type,
    Map? changeData,
    bool enable = true,
    double height = 300,
    double width = 0,
    EdgeInsets margin = EdgeInsets.zero,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    if (width < deviceStore.width / 3) {
      width = deviceStore.width;
    }
    Size buttonSize = Size(
        (width - padding.left - padding.right - margin.left - margin.right) / 3,
        (height - padding.top - padding.bottom) / 4);
    Column column({required int column}) {
      Widget lastColumn = column != 3
          ? Text(column == 1 ? "" : "0")
          : SvgPicture.asset("assets/icons/delete_keyboard.svg");

      TextButton textButton({
        required VoidCallback? onPressed,
        required Widget child,
      }) {
        return TextButton(
          onPressed: onPressed,
          child: child,
          style: TextButton.styleFrom(
            onSurface: Colors.white,
            minimumSize: buttonSize,
            textStyle: const TextStyle(
                fontFamily: "Boilover-Regular",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white),
          ),
        );
      }

      int value1 = column, value2 = column + 3, value3 = column + 6;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textButton(
              onPressed: enable
                  ? () {
                      // controller.text = controller.text + value1.toString();
                      changeData![type] = changeData[type] + value1.toString();
                      print(changeData[type]);
                    }
                  : null,
              child: Text("$value1")),
          textButton(
              onPressed: enable
                  ? () {
                      // controller.text = controller.text + value2.toString();
                      changeData![type] = changeData[type] + value2.toString();
                      print(changeData[type]);
                    }
                  : null,
              child: Text("$value2")),
          textButton(
              onPressed: enable
                  ? () {
                      // controller.text = controller.text + value3.toString();
                      changeData![type] = changeData[type] + value3.toString();
                      print(changeData[type]);
                    }
                  : null,
              child: Text("$value3")),
          textButton(
              onPressed: column == 2 && enable
                  ? () {
                      // controller.text = controller.text + "0";
                      changeData![type] = changeData[type] + "0";
                      // changeData![type] = controller.text;
                      print(changeData[type]);
                    }
                  : column == 3
                      ? () {
                          // if (controller.text.isNotEmpty) {
                          // controller.text = controller.text
                          // .substring(0, controller.text.length - 1);
                          if (changeData![type].length > 0) {
                            changeData[type] = changeData[type]
                                .substring(0, changeData[type].length - 1);
                          }
                          print(changeData[type]);
                        }
                      : null,
              child: lastColumn)
        ],
      );
    }

    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          column(column: 1),
          column(column: 2),
          column(column: 3),
        ],
      ),
    );
  }
}
