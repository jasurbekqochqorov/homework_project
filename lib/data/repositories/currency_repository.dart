import '../../services/service_locator.dart';
import '../api_provider.dart';
import '../models/network_response.dart';

class CurrencyRepository {
  Future<NetworkResponse> getCurrencies() async {
    return locator.get<ApiProvider>().getCurrencies();
  }
}
