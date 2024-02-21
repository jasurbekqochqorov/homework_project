class CategoriesModel{
  final int id;
  final String name;
  final String imageUrl;
  final String createdAt;


  CategoriesModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.createdAt
});

  factory CategoriesModel.fromJson(Map<String,dynamic> json){
    return CategoriesModel(
        id:json['id'] as int? ?? 0,
        imageUrl:json['image_url'] as String? ?? "",
        name: json['name'] as String? ?? "",
        createdAt: json['created_at'] as String? ?? ""
    );
  }
}