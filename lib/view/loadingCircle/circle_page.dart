import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_work/view/loadingCircle/circle_painter.dart';

class circlePage extends StatefulWidget {
  const circlePage({super.key});

  @override
  State<circlePage> createState() => _circlePageState();
}

class _circlePageState extends State<circlePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  double diameter = 200;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _controller.isAnimating
              ? Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                          angle: _controller.value * 2 * pi,
                          child: Container(
                            width: diameter / 3,
                            height: diameter - (diameter / 10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.blue],
                                    begin: Alignment.center,
                                    end: Alignment.centerRight)),
                          ));
                    },
                  ),
                )
              : Container(),
          CustomPaint(
            size: Size(diameter, diameter),
            painter: loadingcustom(),
          ),
        ],
      ),
    );
  }

  Widget loadingview() {
    return _controller.isAnimating ? Container() : Container();
  }
}
