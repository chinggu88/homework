import 'dart:math';

import 'package:flutter/material.dart';

class loadingcustom extends CustomPainter {
  Paint circle = Paint()
    ..color = Colors.white
    ..strokeWidth = 10;
  Paint quadrant = Paint()
    ..color = Colors.white
    ..strokeWidth = 5
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.height / 2, size.height / 2),
        (size.width / 2) - 50, circle);

    final quadrant1 = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height / 2)
      ..lineTo(40, size.height / 2)
      ..addArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: (size.width / 2) - 40),
        degreeToRadian(degree: 180),
        degreeToRadian(degree: 90),
      )
      ..lineTo(size.width / 2, 0)
      ..lineTo(0, 0);

    final quadrant2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2, 40)
      ..addArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: (size.width / 2) - 40),
        degreeToRadian(degree: 270),
        degreeToRadian(degree: 90),
      )
      ..lineTo(size.height, (size.width / 2))
      ..lineTo(size.height, 0);

    final quadrant3 = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height / 2)
      ..lineTo(40, size.height / 2)
      ..addArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: (size.width / 2) - 40),
        degreeToRadian(degree: 180),
        degreeToRadian(degree: -90),
      )
      ..lineTo(size.height / 2, size.width)
      ..lineTo(0, size.height);

    final quadrant4 = Path()
      ..moveTo(size.height, size.width)
      ..lineTo(size.height, size.width / 2)
      ..lineTo(size.height - 40, (size.width / 2))
      ..addArc(
        Rect.fromCircle(
            center: Offset(size.height.toInt() / 2, size.width.toInt() / 2),
            radius: (size.width / 2) - 40),
        degreeToRadian(degree: 0),
        degreeToRadian(degree: 90),
      )
      ..lineTo((size.height / 2), size.width)
      ..lineTo(size.height, size.width);
    ;
    canvas.drawPath(quadrant1, quadrant);
    canvas.drawPath(quadrant2, quadrant);
    canvas.drawPath(quadrant3, quadrant);
    canvas.drawPath(quadrant4, quadrant);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  ///각도를 라디안으로 변환
  double degreeToRadian({required double degree}) {
    return degree * (pi / 180);
  }
}
