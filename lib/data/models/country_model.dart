import 'package:flutter/cupertino.dart';

class CountryModel {
  final Map<String,dynamic> name;
  final int population;
  final List <String> capital;
  final Map<String,dynamic> flag;

  CountryModel({
    required this.name,
    required this.population,
    required this.capital,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] ?? {},
      population: json['population']as int? ?? 0,
      capital: json['capital'] !=null? List<String>.from(json['capital']):[],
      flag: json['flags']?? {},

    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': {'common': name},
      'population': population,
      'capital': [capital],
      'flags': {'png': flag},
    };
  }
}
