// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/repository/user_repo.dart';

import '../data/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({
    required this.userRepo,
  }){
    fetchUserData();
  }

  final UserRepo userRepo;

  bool isLoading = false;
  List<UserModel> users = [];

  fetchUserData() async {
    isLoading = true;
    notifyListeners();
    var cur = await userRepo.getUsers();
    isLoading = false;
    notifyListeners();
    users = cur;
    notifyListeners();
  }
}
