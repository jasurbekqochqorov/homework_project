

class DataModel{
  final int id;
  final String title;
  final int userId;

  DataModel({
    required this.id,
    required this.title,
    required this.userId
});

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      userId: json['userId'] as int? ?? 0
    );
  }
}