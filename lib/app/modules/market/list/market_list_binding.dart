import 'package:get/get.dart';

import 'market_list_controller.dart';

class MarketListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MarketListController>(MarketListController(), permanent: true);
  }
}
