import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Clock_controller extends GetxController {
  static Clock_controller get to => Get.find();
  //시
  RxString HH = '0'.obs;
  //분
  RxString MM = '0'.obs;
  //초
  RxString SS = '0'.obs;
  //타이머
  Timer? _timer;
  //AM or PM
  RxBool night = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    ///타이머 셋팅
    starttimer();

    ///시간 설정
    settime();
  }

  void starttimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      settime();
    });
  }

  void settime() {
    DateTime now = DateTime.now();
    now.hour < 10 ? HH('0' + now.hour.toString()) : HH(now.hour.toString());
    now.minute < 10
        ? MM('0' + now.minute.toString())
        : MM(now.minute.toString());
    now.second < 10
        ? SS('0' + now.second.toString())
        : SS(now.second.toString());
  }
}
