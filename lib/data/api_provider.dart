import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'models/currency_model.dart';
import 'models/network_response.dart';
import 'my_custom_exception.dart';

class ApiProvider {
  static Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://nbu.uz/en/exchange-rates/json/"));

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          statusCode: response.statusCode,
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => CurrencyModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return NetworkResponse(
        errorText: getErrorMessage(response.statusCode),
        statusCode: response.statusCode,
      );
    } on SocketException {
      return NetworkResponse(errorText: "INTERNETNI YOQING!");
    } on FormatException {
      return NetworkResponse(errorText: "FILE FORMATI XATO");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
