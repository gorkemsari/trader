import 'package:get/get.dart';
import 'package:trader/core/common/helper/i_preferences_helper.dart';
import 'package:trader/core/common/helper/preferences_helper.dart';
import 'package:trader/core/services/binance/binance_service.dart';
import 'package:trader/core/services/binance/i_binance_service.dart';
import 'package:trader/core/services/binance/responses/ticker_price_response.dart';

class MarketListController extends GetxController {
  final IBinanceService binanceService = Get.put(BinanceService());
  final IPreferencesHelper preferencesHelper = Get.put(PreferencesHelper());

  var usdtList = <TickerPriceResponse>[].obs;

  @override
  void onInit() async {
    super.onInit();

    await getList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getList() async {
    var usdts = <TickerPriceResponse>[];
    var coins = <String>[];
    var list = await binanceService.tickerPriceList();

    list.sort((a, b) => a.symbol.compareTo(b.symbol));

    list.forEach((item) {
      var last4 = item.symbol.substring(item.symbol.length - 4);

      if (last4 == 'USDT') {
        coins.add(item.symbol);
        item.symbol = item.symbol.substring(0, item.symbol.length - 4);
        usdts.add(item);
      }
    });

    usdtList.value = usdts;
    preferencesHelper.setCoinList(coins);
  }
}
