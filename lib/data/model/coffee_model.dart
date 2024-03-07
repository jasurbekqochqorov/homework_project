import 'package:homework12/data/model/enum_type.dart';

class CoffeeModel{
  final int? id;
  final int categoryId;
  final String name;
  final String image;
  final String description;
  final String subtitle;
  final int rate;
  final int price;
  final String type;

  CoffeeModel({
    this.id,
    required this.image,
    required this.price,
    required this.description,
    required this.name,
    required this.categoryId,
    required this.rate,
    required this.subtitle,
    required this.type
});

  CoffeeModel copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? image,
    String? description,
    String? subtitle,
    int? rate,
    int? price,
    String? type,
  }) {
    return CoffeeModel(
      description: description ?? this.description,
      name: name ?? this.name,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      type: type ?? this.type,
    );
  }

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      description: json['description'] as String? ?? "",
      name: json['name'] as String? ?? "",
      image: json['image'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      subtitle: json['subtitle'] as String? ?? "",
      categoryId:json['categoryId'] as int? ?? 0,
      rate: json['rate'] as int? ?? 0,
      type: (json["type"] as String? ?? ''));
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "subtitle": subtitle,
      'categoryId': categoryId,
      "name":name,
      "rate":rate,
      "type":type,
      "image":image,
      "price":price,
    };
  }

  bool canAddTaskToDatabase() {
    if (subtitle.isEmpty) return false;
    if (description.isEmpty) return false;
    if (name.isEmpty) return false;
    if (image.isEmpty) return false;
    if (type.isEmpty) return false;
    if (categoryId==0) return false;
    if (price == 0) return false;
    if (rate == 0) return false;
    return true;
  }

  static CoffeeModel initialValue = CoffeeModel(
    description: "",
    subtitle: "",
    image: "",
    name: "",
    price: 0,
    rate: 0,
    type:'L',
    categoryId: 0,
  );
}


// TypeCoffee getType(String typeCoffee) {
//   switch (typeCoffee) {
//     case "L":
//       {
//         return TypeCoffee.L;
//       }
//     case "S":
//       {
//         return TypeCoffee.S;
//       }
//     default:
//       {
//         return TypeCoffee.M;
//       }
//   }
// }
