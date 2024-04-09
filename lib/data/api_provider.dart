
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../utils/constants/app_constants.dart';
import 'api_client.dart';
import 'models/currency_model.dart';

class ApiProvider extends ApiClient {

  Future<List<ProductModel>> getCurrencies() async {
    List<ProductModel> currencies = [];
    try {
      Response response = await dio.get(AppConstants.currenciesEndPoint);
      if (response.statusCode == 200) {
        currencies = (response.data['items'] as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
            [];
        return currencies;
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }
    return currencies;
  }


  Future<void> addCurrencies(ProductModel productModel) async {
    try {
      await dio.post(AppConstants.currenciesEndPoint,data:(jsonEncode([productModel.toJson()])));
    } catch (error) {
      debugPrint("ERROR:$error");
    }
  }
  Future<void> updateCurrencies(ProductModel productModel) async {
    try {
      await dio.put(AppConstants.currenciesEndPoint,data:(jsonEncode([productModel.toJsonForUpdate()])));
    } catch (error) {
      debugPrint("ERROR:$error");
    }
  }




  Future<void> deleteProducts(String productUUID) async {
    try {
      await dio.delete("${AppConstants.currenciesEndPoint}/$productUUID",);

    } catch (error) {

    }
  }

}


