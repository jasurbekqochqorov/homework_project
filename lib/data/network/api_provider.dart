import 'dart:convert';

import 'package:homework12/data/models/my_responce.dart';
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> getAllProducts() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> addProducts(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.post(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([productModel.toJson()])
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: 'Success',
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteProducts(String productUUID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.delete(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([{
            "_uuid":productUUID,
          }])
      );

      if (response.statusCode == 201) {
        return MyResponse(
          data: 'delete',
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateProducts(ProductModel productModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.put(
          uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([productModel.toJsonForUpdate()])
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: 'update',
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}