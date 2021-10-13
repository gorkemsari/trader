import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'market_list_controller.dart';

class MarketListMiddleware extends GetMiddleware {
  @override
  Widget onPageBuilt(Widget page){
    // Go to last position of scroll.
    Future.delayed(Duration.zero, () {
      //final controller = Get.find<MarketListController>();
      //todo: jump scroll to last position
    });

    return page;
  }
}