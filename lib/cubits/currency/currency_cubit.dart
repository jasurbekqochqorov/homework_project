import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/country_model.dart';

import '../../data/api_provider.dart';
import '../../data/models/forms_status.dart';
import '../../data/models/network_response.dart';
import 'currency_state.dart';

class CurrenciesCubit extends Cubit<CurrencyState> {
  CurrenciesCubit()
      : super(
          CurrencyState(
            formsStatus: FormsStatus.pure,
            statusText: "",
            currencies: [],
          ),
        ) {
    //fetchCurrencies();
  }

  fetchCurrencies() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          currencies: response.data as List<CountryModel>,
          formsStatus: FormsStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        statusText: response.errorText,
        formsStatus: FormsStatus.error,
      ));
    }
  }
}
