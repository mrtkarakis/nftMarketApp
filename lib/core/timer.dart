import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

import 'text_widget.dart';

class TimerText extends StatefulWidget {
  DateTime? duration;
  int resendTime;

  TimerText({
    Key? key,
    required this.duration,
    required this.resendTime,
  }) : super(key: key);

  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    isActive = DateTime.now().millisecondsSinceEpoch > widget.resendTime;

    if (!isActive) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          setState(
            () {
              widget.duration = (DateTime.fromMillisecondsSinceEpoch(
                  (DateTime.now().millisecondsSinceEpoch - widget.resendTime)
                      .abs()));
            },
          );
        },
      );
    }
    return textWidget(
        isActive
            ? "00:00"
            : widget.duration == null
                ? "01:59"
                : "${(widget.duration!.minute.toString())}:${(widget.duration!.second.toString())}",
        fontWeight: FontWeight.w700,
        fontSize: 28,
        letterSpacing: 1.5);
  }
}
