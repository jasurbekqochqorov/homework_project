import 'package:flutter/foundation.dart';
import 'package:homework12/data/local/local_database.dart';
import '../data/models/place_model.dart';

class AddressesViewModel extends ChangeNotifier {
  AddressesViewModel() {
    init();
    notifyListeners();
  }

  init()async{
    myAddresses=await LocalDatabase.getAllItems();
    notifyListeners();
  }
  List<PlaceModel> myAddresses = [];

  bool _isLoading = false;

  bool get getLoader => _isLoading;

  addNewAddress(PlaceModel placeModel) async {
    // myAddresses.add(placeModel);
    LocalDatabase.insertPlace(placeModel);
    notifyListeners();
  }

  deleteAddress(PlaceModel placeModel){
    LocalDatabase.deleteTask(placeModel.id!);
    init();
    notifyListeners();
  }
  updateAddress(PlaceModel placeModel){
    LocalDatabase.updatePlace(placeModel,placeModel.id!);
  }

  // _notify(bool v) {
  //   _isLoading = v;
  //   notifyListeners();
  // }
}
