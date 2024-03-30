import 'package:flutter/foundation.dart';
import 'package:homework12/data/local/local_database.dart';

import '../data/models/place_model.dart';

class AddressesViewModel extends ChangeNotifier {
  AddressesViewModel() {
    myAddresses = [];
    init();
  }

  init()async{
    _notify(true);
    myAddresses=await LocalDatabase.getAllTask();
    debugPrint('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:${myAddresses.length}');
    _notify(false);
  }
  List<PlaceModel> myAddresses = [];

  bool _isLoading = false;

  bool get getLoader => _isLoading;

  addNewAddress(PlaceModel placeModel) async {
    // myAddresses.add(placeModel);
    LocalDatabase.insertTask(placeModel);
    notifyListeners();
  }

  deleteAddress(){

  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}
