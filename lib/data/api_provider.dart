
import 'dart:convert';

import 'package:homework12/data/models/model.dart';
import 'package:http/http.dart' as http;
import 'models/network_response.dart';

class ApiProvider{
  static Future<NetworkResponse> fetchUser()async{
    NetworkResponse networkResponse=NetworkResponse();
    try{
      http.Response response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/"));
      if(response.statusCode==200){
        networkResponse.data=(jsonDecode(response.body)as List).map((e) => DataModel.fromJson(e)).toList()??[];
      }
    }catch(e){
      networkResponse.errorText=e.toString();
    }
    return networkResponse;
  }
}