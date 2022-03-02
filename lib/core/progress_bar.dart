import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int maxValue;
  final int value;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color progressColor;
  final bool animation;
  final Duration duration;

  const ProgressBar({
    Key? key,
    required this.maxValue,
    this.value = 0,
    this.height = 6,
    this.width = double.infinity,
    this.backgroundColor = Colors.white38,
    this.progressColor = Colors.white,
    this.animation = true,
    this.duration = const Duration(milliseconds: 750),
  }) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late bool animation;
  @override
  void initState() {
    super.initState();
    animation = widget.animation;
    Future.delayed(
        const Duration(milliseconds: 10),
        () => setState(
              () => animation = false,
            ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.height),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.height),
        ),
        child: Row(children: [
          Flexible(
            flex: widget.value,
            child: AnimatedSize(
              duration: widget.duration,
              child: Container(
                width: animation ? 0 : null,
                decoration: BoxDecoration(
                  color: widget.progressColor,
                  borderRadius: BorderRadius.circular(widget.height),
                ),
              ),
            ),
          ),
          widget.value != widget.maxValue
              ? Spacer(
                  flex: widget.maxValue - widget.value,
                )
              : const Padding(padding: EdgeInsets.zero)
        ]),
      ),
    );
  }
}

// ClipRRect progressBar({
//   required int maxValue,
//   int value = 0,
//   // bool showAnimation = true,
//   double height = 6,
//   double width = double.infinity,
//   Color backgroundColor = Colors.white38,
//   Color progressColor = Colors.white,
// }) {
//   if (value >= maxValue) value = maxValue;

//   return ClipRRect(
//     borderRadius: BorderRadius.circular(height),
//     child: Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(height),
//       ),
//       child: Row(children: [
//         Flexible(
//           flex: value,
//           child: Observer(builder: (_) {
//             // Future.delayed(const Duration(milliseconds: 10),
//             //     () => profilePageStore.animation = false);
//             return AnimatedSize(
//               duration: const Duration(milliseconds: 750),
//               child: Container(
//                 // duration: const Duration(milliseconds: 750),
//                 // width: profilePageStore.animation ? 0 : null,
//                 decoration: BoxDecoration(
//                   color: progressColor,
//                   borderRadius: BorderRadius.circular(height),
//                 ),
//               ),
//             );
//           }),
//         ),
//         value != maxValue
//             ? Spacer(
//                 flex: maxValue - value,
//               )
//             : const Padding(padding: EdgeInsets.zero)
//       ]),
//     ),
//   );
// }
