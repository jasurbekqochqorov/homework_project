import 'api_provider.dart';
import 'models/currency_model.dart';

class CurrenciesRepo {
  CurrenciesRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<CurrencyModel>> getCurrencies() => apiProvider.getCurrencies();
}
