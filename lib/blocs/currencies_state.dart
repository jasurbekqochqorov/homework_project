
import '../data/models/currency_model.dart';

abstract class CurrenciesState {}

class CurrenciesSuccessState extends CurrenciesState {
  final List<ProductModel> currencies;

  CurrenciesSuccessState({required this.currencies});
}

class CurrenciesInitialState extends CurrenciesState {}

class CurrenciesLoadingState extends CurrenciesState {}

class CurrenciesErrorState extends CurrenciesState {
  final String errorText;

  CurrenciesErrorState(this.errorText);
}
