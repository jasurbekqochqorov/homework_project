import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/laptop/laptop-model.dart';
import '../network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> fetchSingleUserData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"));

      if (response.statusCode == 200) {
        networkResponse.data = LaptopModel.fromJson(jsonDecode(response.body));
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }



}
