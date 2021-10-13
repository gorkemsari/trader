import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

/// Base service for rest api.
class BaseService extends GetConnect {
  @override
  bool get allowAutoSignedCert => true;

  @override
  void onInit() {
    httpClient.baseUrl = "https://api1.binance.com/api/v3";
    httpClient.timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier((Request request) async {
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    //var headers = {'Authorization': "Bearer $token"};

    httpClient.addAuthenticator((Request request) async {
      //request.headers.addAll(headers);
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode == HttpStatus.unauthorized) {}

      return response;
    });

    super.onInit();
  }
}
