import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/repository/country_repo.dart';

import '../data/models/country_model.dart';

class CountriesViewModel extends ChangeNotifier {
  CountriesViewModel({required this.countryRepository}) {
    _fetchCountries();
  }

  final CountryRepository countryRepository;

  bool isLoading = false;
  List<CountryModel> countries = [];

  _fetchCountries() async {
    isLoading = true;
    notifyListeners();

    var states = await countryRepository.getCountries();
    debugPrint(states.toString());
    isLoading = false;
    notifyListeners();
    countries = states;
      notifyListeners();


    // if (states.isEmpty) {
    // } else {
    //   countries = states;
    //   notifyListeners();
    // }
  }
}
