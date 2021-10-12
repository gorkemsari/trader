import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alarm_add_controller.dart';

class AlarmAddView extends StatelessWidget {
  final controller = Get.put(AlarmAddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          //height: 700,
          width: 400.0,
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 0.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Alarm Ekle",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        //_closeButton(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          tooltip: 'Kapat',
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8.0, bottom: 8.0),
                      child: DropdownButton<String>(
                        value: controller.selectedCoin.value,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 12,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black87),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedCoin.value = newValue;
                            controller.getLastPrice(newValue);
                          }
                        },
                        items: controller.coinList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8.0, bottom: 8.0),
                      child: DropdownButton<String>(
                        value: controller.selectedOperator.value,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 12,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black87),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedOperator.value = newValue;
                          }
                        },
                        items: <String>['<', '>']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8.0, bottom: 8.0),
                      child: TextField(
                        controller: controller.priceTextController.value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Fiyat",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 8.0, bottom: 8.0),
                    child: ElevatedButton(
                      child: const Text('Ekle'),
                      onPressed: () {
                        controller.addAlarm();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
