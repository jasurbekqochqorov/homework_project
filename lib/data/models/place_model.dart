
import '../local/local_database.dart';

class PlaceModel {
  PlaceModel(
      {
        this.id,
    required this.placeCategory,
    required this.lat,
    required this.long,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
    this.docId,
  });
  final int? id;
  final String? docId;
  final double lat;
  final double long;
  final String placeName;
  final String placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json[PlaceModelConstants.id] as int? ?? 0,
      docId: json['docId'] as String?,
      placeCategory: json[PlaceModelConstants.placeCategory] as String,
      lat: double.parse(json[PlaceModelConstants.lat] as String? ?? "0.0"),
      long: double.parse(json[PlaceModelConstants.long] as String? ?? "0.0"),
      placeName: json[PlaceModelConstants.placeName] as String? ?? '',
      entrance: json[PlaceModelConstants.entrance] as String? ?? '',
      stage: json[PlaceModelConstants.stage] as String? ?? '',
      flatNumber: json[PlaceModelConstants.flatNumber] as String? ?? '',
      orientAddress: json[PlaceModelConstants.orientAddress] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    PlaceModelConstants.placeCategory: placeCategory,
    PlaceModelConstants.lat: lat,
    PlaceModelConstants.long: long,
    PlaceModelConstants.placeName: placeName,
    PlaceModelConstants.entrance: entrance,
    PlaceModelConstants.stage: stage,
    PlaceModelConstants.flatNumber: flatNumber,
    PlaceModelConstants.orientAddress: orientAddress,
  };

  PlaceModel copyWith({
    int? id,
    String? docId,
    String? placeCategory,
    double? lat,
    double? long,
    String? placeName,
    String? entrance,
    String? stage,
    String? flatNumber,
    String? orientAddress,
  }) {
    return PlaceModel(
      docId: docId ?? this.docId,
      placeCategory: placeCategory ?? this.placeCategory,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      placeName: placeName ?? this.placeName,
      entrance: entrance ?? this.entrance,
      stage: stage ?? this.stage,
      flatNumber: flatNumber ?? this.flatNumber,
      orientAddress: orientAddress ?? this.orientAddress,
    );
  }
  static PlaceModel initialValue = PlaceModel(
      placeName: "",
      entrance: "",
      placeCategory:"work",
      lat:0.0,
      long: 0.0,
      flatNumber: "",
      stage: "",
      orientAddress: ""
  );
}



