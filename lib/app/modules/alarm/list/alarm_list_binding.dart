import 'package:get/get.dart';

import 'alarm_list_controller.dart';

class AlarmListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlarmListController>(AlarmListController(), permanent: true);
  }
}
