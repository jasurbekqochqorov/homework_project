

import 'package:flutter/cupertino.dart';

class AgentsModel{
  final String displayName;
  final String developerName;
  final String displayIcon;
  final List<dynamic> backgroundGradientColors;

  AgentsModel({
    required this.backgroundGradientColors,
    required this.developerName,
    required this.displayIcon,
    required this.displayName
});

  factory AgentsModel.fromJson(Map<String,dynamic> json){
   return AgentsModel(
       backgroundGradientColors:(json['backgroundGradientColors'] as List<dynamic>).map((e) =>e).toList(),
       developerName: json['developerName'],
       displayIcon: json['displayIcon'],
       displayName: json['displayName']);
  }


}