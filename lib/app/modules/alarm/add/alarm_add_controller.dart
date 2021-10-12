import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/app/modules/alarm/list/alarm_list_controller.dart';
import 'package:trader/core/common/helper/i_preferences_helper.dart';
import 'package:trader/core/common/helper/preferences_helper.dart';
import 'package:trader/core/services/binance/binance_service.dart';
import 'package:trader/core/services/binance/i_binance_service.dart';

class AlarmAddController extends GetxController {
  final IBinanceService binanceService = Get.put(BinanceService());
  final IPreferencesHelper preferencesHelper = Get.put(PreferencesHelper());

  final listController = Get.find<AlarmListController>();

  var coinList = <String>[];
  var selectedCoin = 'BTCUSDT'.obs;
  var selectedOperator = '<'.obs;

  var priceTextController = TextEditingController().obs;

  var periodicTask = "periodicTask";

  @override
  void onInit() async {
    super.onInit();

    coinList = await preferencesHelper.getCoinList() as List<String>;

    await getLastPrice(selectedCoin.value);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getLastPrice(String symbol) async {
    var response = await binanceService.tickerPrice(symbol);
    priceTextController.value.text = response.price;
  }

  Future addAlarm() async {
    var alarmList = await preferencesHelper.getAlarmList();

    alarmList ??= <String>[];

    var hasSymbol = false;
    alarmList.forEach((element) {
      if (selectedCoin.value == element.split(' ')[0]) {
        hasSymbol = true;
      }
    });

    if (!hasSymbol) {
      var item =
          '${selectedCoin.value} ${selectedOperator.value} ${priceTextController.value.text}';
      alarmList.add(item);
      await preferencesHelper.setAlarmList(alarmList);

      listController.getAlarmList();

      Get.back();

      Get.snackbar("Başarılı", 'Alarm eklendi',
          icon: const Icon(
            Icons.done,
            color: Colors.green,
          ),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400);
    }
  }
}
