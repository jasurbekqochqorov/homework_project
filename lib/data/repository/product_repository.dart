
import 'package:homework12/data/network/api_provider.dart';

import '../models/my_responce.dart';

class ProductsRepository{

  Future<MyResponse> getAllProducts()=>ApiProvider.getAllProducts();
}