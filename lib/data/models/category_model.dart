class CategoryModel {
  String name;
  int id;

  CategoryModel({required this.id, required this.name});

  CategoryModel copyWith({
    int? id,
    String? name,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id:json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
    );
  }
}

List<CategoryModel> categories=[
  CategoryModel(id: 1, name:"Phones"),
  CategoryModel(id:2, name: "Laptop"),
  CategoryModel(id: 3, name: "TV"),
  CategoryModel(id: 4, name: "Furniture"),
  CategoryModel(id: 5, name: "Headphones"),
  CategoryModel(id: 6, name: "Clothes"),
];
