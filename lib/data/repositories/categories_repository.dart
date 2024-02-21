
import '../network/api_provider.dart';
import '../network_response.dart';

class CategoriesRepository {
  Future<NetworkResponse> getCategories() async =>
      await ApiProvider.fetchCategories();
}
