import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nftappdesign/globale.dart';

class AnimatedButton extends StatefulWidget {
  final String type;
  final int index;

  const AnimatedButton({Key? key, required this.type, required this.index})
      : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _animated = false;
  bool enable = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: ((5 - widget.index) * 450).toInt()),
        () {
      setState(() {
        _animated = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Observer(
          builder: (_) {
            return AnimatedOpacity(
              curve: Curves.easeInQuad,
              opacity: menuStore.animated2
                  ? 0
                  : _animated
                      ? 1
                      : 0,
              onEnd: () {
                setState(() {
                  enable = true;
                });
              },
              duration: Duration(milliseconds: menuStore.animated2 ? 123 : 700),
              child: ElevatedButton(
                onPressed: enable
                    ? () {
                        menuStore.animated2 = true;
                        menuStore.changeMenuOpen(false);

                        menuStore.changeType(widget.type);
                      }
                    : null,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/${widget.type.toLowerCase()}.png",
                      height: 23,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Text(widget.type),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.white,
                    minimumSize: Size(deviceStore.width - 40, 55),
                    side: const BorderSide(color: Colors.white, width: 0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            );
          },
        ),
      ],
    );
  }
}
