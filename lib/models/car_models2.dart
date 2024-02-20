class CarModels2 {

  final int id;
  final String carModel;
  final int averagePrice;
  final String logo;
  final int establishedYear;
   final String description;
   final List<String> pics;

  CarModels2({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
    required this.description,
    required this.pics
  });

  factory CarModels2.fromJson(Map<String, dynamic> json){
    return CarModels2(
      id:json['id'] as int ?? 0,
      carModel:json['car_model'] as String ?? "",
      averagePrice: json['average_price'] as int ?? 0,
      logo:json['logo'] as String ?? '',
      establishedYear: json['established_year'] as int ?? 0,
       description: json['description'] as String ?? "",
      pics:(json['car_pics'] as List<dynamic>).map((e) => e.toString()).toList() ?? [],
    );
  }

}