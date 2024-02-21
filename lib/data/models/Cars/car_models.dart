import 'dart:math';

class CarModels {

  final int id;
  final String carModel;
  final int averagePrice;
  final String logo;
  final int establishedYear;


  CarModels({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CarModels.fromJson(Map<String, dynamic> json){
    return CarModels(
        id:json['id'] as int ?? 0,
        carModel:json['car_model'] as String ?? "",
        averagePrice: json['average_price'] as int ?? 0,
        logo:json['logo'] as String ?? '',
        establishedYear: json['established_year'] as int ?? 0,

    );
  }

}