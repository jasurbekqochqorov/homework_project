import 'dart:convert';
import 'dart:io';
import 'package:homework12/data/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'models/network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"));
      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: ((jsonDecode(response.body) as List?))
                  ?.map((e) => IncomesModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return NetworkResponse(errorText: "Noma'lum xatolik");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
