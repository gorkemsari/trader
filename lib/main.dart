import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/core/common/helper/i_preferences_helper.dart';
import 'package:trader/core/common/helper/preferences_helper.dart';
import 'package:trader/core/services/binance/binance_service.dart';
import 'package:trader/core/services/binance/i_binance_service.dart';
import 'package:workmanager/workmanager.dart';

import 'app/routes/app_pages.dart';

const periodicTask = "periodicTask";

final IBinanceService binanceService = Get.put(BinanceService());
final IPreferencesHelper preferencesHelper = Get.put(PreferencesHelper());

void main() async {
  runApp(
    GetMaterialApp.router(
      title: "Trader",
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fade,
    ),
  );

  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  await registerPeriodicTask();
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case periodicTask:
        var marketList = await binanceService.tickerPriceList();
        var alarmList = await preferencesHelper.getAlarmList();

        if (alarmList != null) {
          alarmList.forEach((alarm) {
            var alarmArray = alarm.split(" ");
            var symbol = alarmArray[0];
            var rule = alarmArray[1];
            var price = double.parse(alarmArray[2].replaceAll(",", ""));

            var marketData =
                marketList.where((element) => element.symbol == symbol).first;

            var marketPrice = double.parse(marketData.price);

            if (rule == ">") {
              if (marketPrice >= price) {
                AudioManager.instance
                    .start("assets/alarm.mp3", "$symbol = $marketPrice",
                        desc: "Alarm: $symbol > $price",
                        cover: "assets/bitcoin.jpeg")
                    .then((err) {});
              }
            } else {
              if (marketPrice <= price) {
                AudioManager.instance
                    .start("assets/alarm.mp3", "$symbol = $marketPrice",
                        desc: "Alarm: $symbol < $price",
                        cover: "assets/bitcoin.jpeg")
                    .then((err) {});
              }
            }
          });
        }
        break;
    }

    return Future.value(true);
  });
}

Future registerPeriodicTask() async {
  await Workmanager().registerPeriodicTask(
    'coin-task',
    periodicTask,
    frequency: const Duration(minutes: 15),
  );
}
