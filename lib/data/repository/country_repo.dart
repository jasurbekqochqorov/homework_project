import 'package:flutter_nt_ten/data/models/country_model.dart';

import '../network/api_provider.dart';

class CountryRepository {
  final ApiProvider apiProvider;

  CountryRepository({required this.apiProvider});


  Future<List<CountryModel>> getCountries() => apiProvider.getCountry();
}
