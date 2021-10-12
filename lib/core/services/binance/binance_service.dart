import 'package:trader/core/services/binance/responses/ticker_price_response.dart';

import '../base_service.dart';
import 'i_binance_service.dart';

class BinanceService extends BaseService implements IBinanceService {
  @override
  Future<List<TickerPriceResponse>> tickerPriceList() async {
    try {
      var response = await get('/ticker/price').timeout(httpClient.timeout);

      var list = TickerPriceResponse.fromJsonListModel(response.body);

      return list;
    } catch (e) {
      return <TickerPriceResponse>[];
    }
  }

  @override
  Future<TickerPriceResponse> tickerPrice(String symbol) async {
    try {
      var response = await get('/ticker/price?symbol=$symbol').timeout(httpClient.timeout);

      var res = TickerPriceResponse.fromJson(response.body);

      return res;
    } catch (e) {
      return TickerPriceResponse(symbol: '', price: '');
    }
  }
}
