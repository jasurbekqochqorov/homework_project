import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'models/currency_model.dart';
import 'models/network_response.dart';


class ApiProvider extends GetConnect {

   Future<NetworkResponse> getCurrencies() async {
    try {
     Response response = await get("https://cbu.uz/uz/arkhiv-kursov-valyut/json/");

      if (response.statusCode == HttpStatus.ok) {
        return NetworkResponse(
          data: (response.body as List?)
                  ?.map((e) => CurrencyModel.fromJson(e))
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
