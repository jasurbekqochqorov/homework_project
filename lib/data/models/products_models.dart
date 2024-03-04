

import 'dart:ui';

class ProductModels{
  final String productName;
  final String productId;
  final DateTime dateTime;
  final int price;
  final String description;
  final String imageUrl;
  final String color;

  ProductModels({
    required this.productId,
    required this.dateTime,
    required this.color,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productName
});

  factory ProductModels.fromJson(Map<String,dynamic> json){
    return ProductModels(
      productId: json['uuid'] as String? ?? "",
      dateTime: DateTime.fromMicrosecondsSinceEpoch((json['_created'] as num).toInt()*1000),
      color:(json['color'] as String? ?? "FFFFFF").toColor(),
        description: json['description'] as String? ?? "",
        price: json['price'] as int? ?? 200,
        imageUrl: json['image_url'] as String? ?? "",
        productName: json['product_name'] as String? ?? "",
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}