import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/app/modules/root/root_controller.dart';
import 'package:trader/core/common/helper/i_preferences_helper.dart';
import 'package:trader/core/common/helper/preferences_helper.dart';

class AlarmListController extends GetxController {
  final IPreferencesHelper preferencesHelper = Get.put(PreferencesHelper());
  final rootController = Get.find<RootController>();

  var alarmList = <String>[].obs;

  var periodicTask = "periodicTask";

  @override
  void onInit() async {
    super.onInit();
    await getAlarmList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getAlarmList() async {
    var list = await preferencesHelper.getAlarmList();

    if (list != null) {
      alarmList.value = list;
    }
  }

  Future removeAlarm(int index) async {
    alarmList.removeAt(index);
    await preferencesHelper.setAlarmList(alarmList);

    Get.snackbar("Başarılı", 'Alarm silindi',
        icon: const Icon(
          Icons.delete,
          color: Colors.green,
        ),
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 400);
  }
}
