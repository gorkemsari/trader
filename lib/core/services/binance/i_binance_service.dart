import 'responses/ticker_price_response.dart';

abstract class IBinanceService {
  Future<List<TickerPriceResponse>> tickerPriceList();
  Future<TickerPriceResponse> tickerPrice(String symbol);
}