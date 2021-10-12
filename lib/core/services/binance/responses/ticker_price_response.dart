class TickerPriceResponse {
  TickerPriceResponse({
    required this.symbol,
    required this.price,
  });

  String symbol;
  String price;

  /// Converts from json to model.
  factory TickerPriceResponse.fromJson(Map<String, dynamic> json) =>
      TickerPriceResponse(
        symbol: json["symbol"],
        price: json["price"],
      );

  /// Converts from json to model as function.
  static TickerPriceResponse fromJsonModel(Map<String, dynamic> json) =>
      TickerPriceResponse.fromJson(json);

  /// Converts from json to list model as function.
  static List<TickerPriceResponse> fromJsonListModel(
      List<dynamic> json) {
    var list = json.map((i) => TickerPriceResponse.fromJson(i)).toList();

    return list;
  }
}
