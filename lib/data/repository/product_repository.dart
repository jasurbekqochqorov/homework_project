
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/data/network/api_provider.dart';

import '../models/my_responce.dart';

class ProductsRepository{

  Future<MyResponse> getAllProducts()=>ApiProvider.getAllProducts();
  Future<MyResponse> addProducts(ProductModel productModel)=>ApiProvider.addProducts(productModel);
  Future<MyResponse> deleteProducts(String productUUID)=>ApiProvider.deleteProducts(productUUID);
  Future<MyResponse> updateProducts(ProductModel productModel)=>ApiProvider.updateProducts(productModel);
}