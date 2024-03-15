import 'package:flutter_nt_ten/data/models/country_model.dart';
import 'package:flutter_nt_ten/data/models/user_model.dart';

import '../network/api_provider.dart';

class UserRepo {
  final ApiProvider aapiProvider;

  UserRepo({required this.aapiProvider});


  Future<List<UserModel>> getUsers() => aapiProvider.getAllUserData();
}
