import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alarm_list_controller.dart';

class AlarmListMiddleware extends GetMiddleware {
  @override
  Widget onPageBuilt(Widget page){
    // Go to last position of scroll.
    Future.delayed(Duration.zero, () {
      final controller = Get.find<AlarmListController>();
      //controller.jumpToLast();
    });

    return page;
  }
}