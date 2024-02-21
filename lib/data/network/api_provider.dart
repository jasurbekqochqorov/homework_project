import 'dart:convert';

import 'package:homework12/data/models/categories/categories.dart';
import 'package:http/http.dart' as http;

import '../models/laptop/laptop-model.dart';
import '../network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> fetchLaptops() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/products"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body)['data'] as List).map((e) =>LaptopModel.fromJson(e)).toList()??[];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchCategories() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body)as List).map((e) =>CategoriesModel.fromJson(e)).toList()??[];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }

}
