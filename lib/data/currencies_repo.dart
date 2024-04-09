import 'api_provider.dart';
import 'models/currency_model.dart';

class CurrenciesRepo {
  CurrenciesRepo();

  Future<List<ProductModel>> getCurrencies() => ApiProvider().getCurrencies();
  Future<void> addCurrencies(ProductModel productModel) => ApiProvider().addCurrencies(productModel);
  Future<void> updateCurrencies(ProductModel productModel) => ApiProvider().updateCurrencies(productModel);
  Future<void> deleteCurrencies(String id) => ApiProvider().deleteProducts(id);
}
