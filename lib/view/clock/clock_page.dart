import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work/controller/clock_controller.dart';
import 'package:home_work/view/clock/clock_painter.dart';

class Clock extends StatelessWidget {
  final controller = Clock_controller.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00ffffff),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: (() {
              Get.back();
            })),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xff2f363e),
      body: Stack(
        children: [
          Center(
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      controller.night.value ? 'PM' : "AM",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 15,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeMiterLimit = 2
                            ..color = Color(0xFFFFFFFF)
                            ..maskFilter =
                                MaskFilter.blur(BlurStyle.solid, 20)),
                      strutStyle: StrutStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${controller.HH} : ',
                        style: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(0xff71f36b)
                              ..maskFilter =
                                  MaskFilter.blur(BlurStyle.solid, 20)),
                      ),
                      Text(
                        '${controller.MM} : ',
                        style: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(0xfff6e94f)
                              ..maskFilter =
                                  MaskFilter.blur(BlurStyle.solid, 20)),
                      ),
                      Text(
                        '${controller.SS}',
                        style: TextStyle(
                            fontSize: 30,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(0xFFEB0981)
                              ..maskFilter =
                                  MaskFilter.blur(BlurStyle.solid, 20)),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
          Center(
            child: Obx(() {
              return CustomPaint(
                size: Size(200, 200),
                painter: clock_paint(controller.HH.value, controller.MM.value,
                    controller.SS.value),
              );
            }),
          )
        ],
      ),
    );
  }
}
