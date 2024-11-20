

import 'package:homework12/data/api_provider.dart';

import 'models/network_response.dart';

class UserRepository{
  Future<NetworkResponse> getAll()=>ApiProvider.fetchUser();
}