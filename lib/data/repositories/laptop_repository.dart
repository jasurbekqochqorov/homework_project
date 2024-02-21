
import '../network/api_provider.dart';
import '../network_response.dart';

class LaptopRepository {
  Future<NetworkResponse> getLaptops() async =>
      await ApiProvider.fetchLaptops();
}
