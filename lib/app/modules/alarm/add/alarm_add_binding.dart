import 'package:get/get.dart';

import 'alarm_add_controller.dart';

class AlarmAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlarmAddController>(AlarmAddController());
  }
}
