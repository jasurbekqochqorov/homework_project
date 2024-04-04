import 'dart:ui';

import 'package:flutter/material.dart';

class NoteModel {
  NoteModel({
    this.id,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  String title;
  String subtitle;
  String color;
  int? id;

  NoteModel copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? color,
  }) =>
      NoteModel(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        color: color ?? this.color,
      );


  factory NoteModel.fromJson(Map<String, dynamic>json){
    return NoteModel(
        title: json['title'] as String? ?? "",
        subtitle: json['subtitle'] as String? ?? "",
        color: json['color'] as String? ?? '',
        id: json['_id'] as int? ?? 0
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      "color": color
    };
  }


}
