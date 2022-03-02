import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final bool value;
  final double height;
  final double width;
  final int milliseconds;

  const SwitchButton({
    Key? key,
    required this.value,
    this.height = 23,
    this.width = 37,
    this.milliseconds = 280,
  }) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  // bool x = false;
  @override
  Widget build(BuildContext context) {
    return

        // TextButton(
        //   onPressed: () {
        //     setState(() {
        //       x = !x;
        //     });
        //   },
        //   child:

        AnimatedContainer(
      duration: Duration(milliseconds: widget.milliseconds),
      alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.milliseconds),
        height: widget.value ? 17 : 12,
        width: widget.value ? 17 : 12,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: !widget.value
                ? Colors.grey.withOpacity(0.55)
                : const Color(0xff24CCA9)),
      ),
      // ),
      // ),

      // style: TextButton.styleFrom(
      //     padding: EdgeInsets.all(12), shape: const StadiumBorder()),
    );
  }
}
