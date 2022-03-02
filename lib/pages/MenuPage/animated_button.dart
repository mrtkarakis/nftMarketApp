import 'package:flutter/material.dart';
import 'package:nftappdesign/globale.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _animated = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 333),
      child: ElevatedButton(
        onPressed: () {
          menuStore.changeMenuOpen(false);
          menuStore.changeMenuClosed(true);
        },
        child: const Text("Art"),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(deviceStore.width - 40, 55),
            side: const BorderSide(color: Colors.white, width: 0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
