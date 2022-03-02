import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nftappdesign/globale.dart';

late int _year;
late int _month;
late int _day;
const Color _purpleColor = Color(0xff8E99EF);

Map<String, GlobalKey<State<StatefulWidget>>> _globalKeys = {
  "day": GlobalKey(),
  "month": GlobalKey(),
  "year": GlobalKey(),
};
double y = 0.0;
double x = 0.0;
double statusBarHeight = 0.0;
Widget birthOfDate(
  BuildContext context, {
  required ScrollController scrollController,
  required Map data,
  double width = 0,
  bool isAgeLimit = false,
  int ageLimit = 18,
  bool signUpPage = false,
  bool profileEditPage = false,
  double borderRadius = 20,
}) {
  Widget dateInfoBox(DateTime date,
      {bool day = false, bool month = false, bool year = false}) {
    // deviceStore.getDate();
    width == 0
        ? width = year ? deviceStore.width / 2.6 : deviceStore.width / 4.5
        : width = width;
    BoxDecoration decoration = BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white.withOpacity(0.23));

    int value = 0;
    if (day) {
      _day = date.day;
      value = date.day;
    } else if (month) {
      _month = date.month;
      value = date.month;
    } else if (year) {
      _year = date.year;
      value = date.year;
    }
    return Container(
      key: _globalKeys[day
          ? "day"
          : month
              ? "month"
              : "year"],
      width: width,
      height: 55,
      decoration: decoration,
      child: TextButton(
        onPressed: () {
          statusBarHeight = MediaQuery.of(context).padding.top;

          if (scrollController.positions.isNotEmpty) {
            scrollController
                .animateTo(0,
                    duration: const Duration(milliseconds: 222),
                    curve: Curves.ease)
                .whenComplete(() {
              RenderBox box = _globalKeys[day
                      ? "day"
                      : month
                          ? "month"
                          : "year"]!
                  .currentContext!
                  .findRenderObject() as RenderBox;
              Offset position =
                  box.localToGlobal(Offset.zero); //this is globale position
              y = position.dy;
              x = position.dx;
            }).whenComplete(() => showDialog(
                    barrierColor: Colors.black.withOpacity(0.65),
                    context: context,
                    builder: (_) => datePicker(context,
                        profileEditPage: profileEditPage,
                        date: date,
                        value: value,
                        width: width,
                        day: day,
                        month: month,
                        year: year,
                        data: data,
                        borderRadius: borderRadius,
                        isAgeLimit: isAgeLimit,
                        ageLimit: ageLimit,
                        topPadding:
                            profileEditPage ? deviceStore.height / 2.999 : 0)));
          } else {
            RenderBox box = _globalKeys[day
                    ? "day"
                    : month
                        ? "month"
                        : "year"]!
                .currentContext!
                .findRenderObject() as RenderBox;
            Offset position =
                box.localToGlobal(Offset.zero); //this is globale position
            y = position.dy;
            x = position.dx;
            showDialog(
                barrierColor: Colors.black.withOpacity(0.65),
                context: context,
                builder: (_) => datePicker(context,
                    profileEditPage: profileEditPage,
                    date: date,
                    value: value,
                    width: width,
                    day: day,
                    month: month,
                    year: year,
                    data: data,
                    borderRadius: borderRadius,
                    isAgeLimit: isAgeLimit,
                    ageLimit: ageLimit,
                    topPadding:
                        profileEditPage ? deviceStore.height / 2.999 : 0));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Center(
            child: Text(
              (value.toString()),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
      ),
    );
  }

  return Observer(builder: (_) {
    DateTime date;

    try {
      date = DateTime.fromMillisecondsSinceEpoch(data["birth"].seconds * 1000);
    } catch (e) {
      date = DateTime.fromMillisecondsSinceEpoch(
          data["birth"].millisecondsSinceEpoch);
    }
    return InkWell(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        dateInfoBox(date, day: true),
        dateInfoBox(date, month: true),
        dateInfoBox(date, year: true),
      ]),
    );
  });
}

Widget datePicker(BuildContext context,
    {required DateTime date,
    required int value,
    required double width,
    required double topPadding,
    required bool day,
    required bool month,
    required bool year,
    required Map data,
    bool isAgeLimit = false,
    int ageLimit = 18,
    double borderRadius = 20,
    bool profileEditPage = false}) {
  bool selectable = true;
  DateTime nowDate = DateTime.now();
  // DateTime nowDate = deviceStore.dateTimeNow;
  PageController pageController = PageController(
    initialPage: value - (year ? 1916 : 4),
    viewportFraction:
        deviceStore.height > 777 ? 0.14 : 130 / deviceStore.height,
  );
  // BoxDecoration decoration = BoxDecoration(
  //   borderRadius: BorderRadius.circular(borderRadius),
  //   color: Colors.white.withOpacity(0.23),
  // );
  double height = 2.75;
  Widget selectDateList() {
    Widget listItem(int index) {
      String text = year
          ? ((index + nowDate.year - 107).toString())
          : ((index + 1).toString());
      bool isSelect = text == (value.toString());
      return Container(
        decoration: BoxDecoration(
            color:
                isSelect ? _purpleColor.withOpacity(0.27) : Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextButton(
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                  color: isSelect
                      ? _purpleColor
                      : selectable
                          ? Colors.black
                          : Colors.grey,
                  fontSize: 16,
                  fontWeight: isSelect ? FontWeight.w600 : FontWeight.w500),
            ),
          ),
          onPressed: selectable
              ? () {
                  if (day) {
                    _day = index + 1;
                  }
                  if (month) {
                    _month = index + 1;
                  }

                  if (year) {
                    _year = index + nowDate.year - 107;
                  }

                  data["birth"] = DateTime(_year, _month, _day);
                  Navigator.pop(context);
                }
              : null,
          style: TextButton.styleFrom(
              primary: _purpleColor,
              fixedSize: Size(width / 1.3, 42),
              tapTargetSize: MaterialTapTargetSize.padded),
        ),
      );
    }

    int februaryRange = 28;
    int itemCount = 12;
    if (year) {
      itemCount = 90;
    } else if (month) {
      itemCount = 12;
      if (date.day > 28 &&
          date.year % 4 == 0 &&
          (date.year % 100 != 0 || date.year % 400 == 0)) {
        februaryRange = 29;
      }
    } else if (day) {
      if (date.month == 2) {
        if (date.year % 4 == 0 &&
            (date.year % 100 != 0 || date.year % 400 == 0)) {
          itemCount = 29;
        } else {
          itemCount = 28;
        }
      } else {
        switch (date.month) {
          case 1:
          case 3:
          case 5:
          case 7:
          case 8:
          case 10:
          case 12:
            itemCount = 31;
            break;
          case 4:
          case 6:
          case 9:
          case 11:
            itemCount = 30;
            break;
          default:
        }
      }
    }
    final bool checkYear = nowDate.year - date.year == ageLimit;
    return Container(
      height: deviceStore.height / height,
      width: width - 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            controller: pageController,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              if (isAgeLimit) {
                if (day) {
                  if (checkYear &&
                      (((nowDate.month <= date.month &&
                              index + 1 > nowDate.day)) ||
                          date.month > nowDate.month)) {
                    selectable = false;
                  } else {
                    selectable = true;
                  }
                } else if (month) {
                  if (checkYear &&
                      (((index + 1 > nowDate.month) &&
                              (nowDate.day >= date.day)) ||
                          date.day > nowDate.day)) {
                    selectable = false;
                    if (date.day > nowDate.day && index + 1 < nowDate.month) {
                      selectable = true;
                    }
                    if (index == 1 && date.day > februaryRange) {
                      selectable = false;
                    }
                  } else {
                    selectable = true;
                    if (index == 1 && date.day > februaryRange) {
                      selectable = false;
                    }
                  }
                } else if (year) {
                  if ((((date.month > nowDate.month) ||
                          (date.month == nowDate.month &&
                              date.day > nowDate.day)) &&
                      (index + nowDate.year - 106) > nowDate.year - ageLimit)) {
                    selectable = false;
                  } else {
                    selectable = true;
                  }
                }
              } else if (month) {
                if (index == 1 && date.day > februaryRange) {
                  selectable = false;
                } else {
                  selectable = true;
                }
              }
              return listItem(index);
            }),
      ),
    );
  }

  Widget selectDateBox() {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white.withOpacity(0.23),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Center(
        child: Text(
          (value.toString()),
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  double padding = 9;
  return Material(
    type: MaterialType.transparency,
    child: Stack(
      children: [
        Positioned(
          left: x,
          top: y - (deviceStore.height / height + padding) - statusBarHeight,
          child: Column(
            children: [
              selectDateList(),
              SizedBox(height: padding),
              selectDateBox(),
            ],
          ),
        ),
      ],
    ),
  );
}
