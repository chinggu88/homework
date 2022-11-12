import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work/const/appPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              //디지털시계
              GestureDetector(
                  onTap: () => Get.toNamed(clock),
                  child: Container(
                      height: Get.size.width,
                      width: Get.size.width * 0.8,
                      child: Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Digital Clock',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '시계정보를 애니메니션으로 표현',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Image.asset('assets/digital_clock.png'),
                            ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
