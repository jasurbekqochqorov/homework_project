
import 'package:homework12/data/models/country_model.dart';

import '../../data/models/forms_status.dart';

class CurrencyState {
  final FormsStatus formsStatus;
  final List<CountryModel> currencies;
  final String statusText;

  CurrencyState({
    required this.formsStatus,
    required this.statusText,
    required this.currencies,
  });

  CurrencyState copyWith({
    FormsStatus? formsStatus,
    List<CountryModel>? currencies,
    String? statusText,
  }) =>
      CurrencyState(
        formsStatus: formsStatus ?? this.formsStatus,
        currencies: currencies ?? this.currencies,
        statusText: statusText ?? this.statusText,
      );
}
