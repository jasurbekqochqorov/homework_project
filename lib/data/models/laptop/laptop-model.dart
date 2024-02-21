
//
// "id": 1,
// "category_id": 1,
// "name": "Macbook",
// "price": 1200,
// "image_url": "https://cdn.arstechnica.net/wp-content/uploads/2021/10/16-inch-MacBook-Pro-open.jpeg"

class LaptopModel{
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;

  LaptopModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.categoryId
});


  factory LaptopModel.fromJson(Map<String,dynamic>json){
    return LaptopModel(
        id:json['id'] as int ?? 0,
        imageUrl:json['image_url'] as String ?? "",
        name: json['nam'] as String ?? "",
        price: json['price'] as int ?? 0,
        categoryId:json['category_id'] as int ?? 0,
    );
  }
}