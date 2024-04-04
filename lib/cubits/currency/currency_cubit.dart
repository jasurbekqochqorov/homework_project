import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/api_provider.dart';
import 'package:homework12/data/models/country_model.dart';
import '../../data/models/network_response.dart';
import 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitialState());

  Future<void> fetchCurrencies() async {
    emit(CurrencyLoadingState());
    NetworkResponse response = await ApiProvider.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(CurrencySuccessState(
          currencies: response.data as List<IncomesModel>));
    } else {
      emit(CurrencyErrorState(errorText: response.errorText));
    }
  }


}