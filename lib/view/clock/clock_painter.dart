import 'dart:math';

import 'package:flutter/material.dart';

class clock_paint extends CustomPainter {
  clock_paint(String hh, String mm, String ss) {
    h = hh;
    m = mm;
    s = ss;
  }
  //시
  String h = '0';
  //분
  String m = '0';
  //초
  String s = '0';

  //시paint
  Paint Hpaint = Paint()
    ..color = Color(0x8044894e)
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  //분paint
  Paint Mpaint = Paint()
    ..color = Color(0x8054583d)
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  //초paint
  Paint Spaint = Paint()
    ..color = Color(0x80a83b68)
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;

  //시 점paint
  Paint Hpoint1 = Paint()..color = Color(0xff71f36b);
  Paint Hpoint2 = Paint()
    ..color = Color(0x4071f36b)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);
  Paint Hpoint3 = Paint()
    ..color = Color(0x4071f36b)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);
  //분 점paint
  Paint Mpoint1 = Paint()..color = Color(0xfff6e94f);
  Paint Mpoint2 = Paint()
    ..color = Color(0x40f6e94f)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);
  Paint Mpoint3 = Paint()
    ..color = Color(0x40f6e94f)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);
  //처 점paint
  Paint Spoint1 = Paint()..color = Color(0x40EB0981);
  Paint Spoint2 = Paint()
    ..color = Color(0x40EB0981)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);
  Paint Spoint3 = Paint()
    ..color = Color(0x40EB0981)
    ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);

  ///각도를 라디언으로 변환
  double degreeToRadian({required double degree}) {
    return degree * (pi / 180);
  }

  /// 기준점에서 특정 각도 + 거리 만큼 떨어진 곳의 좌표를 구함
  Offset getPos(
      {required double degree,
      required double distance,
      required double x,
      required double y}) {
    double dx = distance * cos(degreeToRadian(degree: degree)) + x;
    double dy = distance * sin(degreeToRadian(degree: degree)) + y;
    return Offset(dx, dy);
  }

  @override
  void paint(Canvas canvas, Size size) {
    //시간 선 그리기
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: 100),
        degreeToRadian(degree: 270),
        degreeToRadian(degree: (360 / 24) * double.parse(h)),
        false,
        Hpaint);
    //분 선 그리기
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: 140),
        degreeToRadian(degree: 270),
        degreeToRadian(degree: (360 / 60) * double.parse(m)),
        false,
        Mpaint);
    //초 선 그리기
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width.toInt() / 2, size.height.toInt() / 2),
            radius: 180),
        degreeToRadian(degree: 270),
        degreeToRadian(degree: (360 / 60) * double.parse(s)),
        false,
        Spaint);
    //시간 점 그리기
    canvas.drawCircle(
        getPos(
            degree: (360 / 24) * double.parse(h) - 90,
            distance: 100,
            x: size.width / 2,
            y: size.height / 2),
        100,
        Hpoint3);
    canvas.drawCircle(
        getPos(
            degree: (360 / 24) * double.parse(h) - 90,
            distance: 100,
            x: size.width / 2,
            y: size.height / 2),
        20,
        Hpoint2);
    canvas.drawCircle(
        getPos(
            degree: (360 / 24) * double.parse(h) - 90,
            distance: 100,
            x: size.width / 2,
            y: size.height / 2),
        10,
        Hpoint1);
    //분 점 그리기
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(m) - 90,
            distance: 140,
            x: size.width / 2,
            y: size.height / 2),
        100,
        Mpoint3);
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(m) - 90,
            distance: 140,
            x: size.width / 2,
            y: size.height / 2),
        20,
        Mpoint2);
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(m) - 90,
            distance: 140,
            x: size.width / 2,
            y: size.height / 2),
        10,
        Mpoint1);
    //초 점 그리기
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(s) - 90,
            distance: 180,
            x: size.width / 2,
            y: size.height / 2),
        180,
        Spoint3);
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(s) - 90,
            distance: 180,
            x: size.width / 2,
            y: size.height / 2),
        20,
        Spoint2);
    canvas.drawCircle(
        getPos(
            degree: (360 / 60) * double.parse(s) - 90,
            distance: 180,
            x: size.width / 2,
            y: size.height / 2),
        10,
        Spoint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
