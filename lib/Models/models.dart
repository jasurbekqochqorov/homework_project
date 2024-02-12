
class Models{
  String image;
  String productName;
  String price;
  ProductsName productsName;
  Models({required this.productName,required this.image,required this.price,required this.productsName});
}

enum ProductsName{
  all,
  computers,
  accessories,
  smartphones,
  smart_objects,
  speakers

}