import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/app/modules/alarm/add/alarm_add_view.dart';

import 'alarm_list_controller.dart';

class AlarmListView extends GetView<AlarmListController> {
  const AlarmListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarms'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alarm),
            onPressed: () {
              Get.dialog(const AlarmAddView());
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.getAlarmList,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.alarmList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 0.0, top: 0.0, bottom: 0.0),
                          child: Text(controller.alarmList[index]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 8.0, top: 0.0, bottom: 0.0),
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.black54,
                            onPressed: () {
                              controller.removeAlarm(index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
