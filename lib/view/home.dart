import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:home_work/const/appPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //디지털시계
              GestureDetector(
                  onTap: () => Get.toNamed(clock),
                  child: Container(
                      height: 50,
                      width: Get.size.width,
                      color: Colors.amber,
                      child: Row(
                        children: [Image.asset('assets/digital_clock.png')],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
