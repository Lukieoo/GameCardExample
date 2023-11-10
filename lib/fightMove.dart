import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  final String damage;
  LogoApp({required this.damage});
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      // } else if (status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    controller.forward();
  }

  Widget build(BuildContext context) {
    return Container(
        child: FadeTransition(
            opacity: animation,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(widget.damage)])));
  }
}
