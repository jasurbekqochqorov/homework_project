import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api/api_client.dart';
import '../data/models/country_model.dart';
import '../data/models/network_response.dart';

part 'countries_event.dart';

part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>((FetchCountries event, emit) async {
      emit(CountriesLoading());
      NetworkResponse networkResponse;
      if (event.qit.isEmpty) {
        networkResponse = await apiClient.getCountries();
      } else {
        networkResponse = await apiClient.getCountriesByContinents(event.qit);
      }

      if (networkResponse.errorText.isEmpty) {
        if (event.search.isEmpty) {
          emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
        }
        else{
          emit(CountriesSuccess((networkResponse.data as List<CountryModel>).where((element) => element.name.toLowerCase().contains(event.search.toLowerCase())).toList()));
        }
      } else {
        emit(CountriesError(networkResponse.errorText));
      }
    });
  }

  final ApiClient apiClient;
}
