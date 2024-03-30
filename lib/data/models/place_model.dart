import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework12/data/models/place_category.dart';

class PlaceModel {
  PlaceModel({
    required this.placeCategory,
    required this.latLng,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
    this.id,
  });

  final int? id;
   final LatLng latLng;
  final String placeName;
 final PlaceCategory placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;

  PlaceModel copyWith({
    int? id,
    String? placeName,
    String? entrance,
    String? stage,
    LatLng? latLng,
    PlaceCategory? placeCategory,
    String? flatNumber,
    String? orientAddress
  }) {
    return PlaceModel(
      placeName: placeName ?? this.placeName,
      entrance: entrance ?? this.entrance,
      stage:  stage ?? this.stage,
      latLng: latLng ?? this.latLng,
      placeCategory: placeCategory ?? this.placeCategory,
      orientAddress: orientAddress ?? this.orientAddress,
      flatNumber: flatNumber ?? this.flatNumber,
    );
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeName: json['place_name'] as String? ?? "",
      entrance: json["entrance"] as String? ?? "",
      placeCategory: getStatus(json['place_category'] as String? ?? ""),
      stage: json["stage"] as String? ?? "",
      flatNumber:json['flat_number'] as String? ?? "",
      orientAddress:json['orient_address'] as String? ?? "",
      latLng: json['lat_lng'] as LatLng? ?? const LatLng(0,0),
      id: json["_id"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "place_name":placeName,
      "entrance": entrance,
      "place_category":placeCategory.name,
      "stage":stage,
      "flat_number":flatNumber,
      "orient_address":orientAddress,
      "lat":latLng.latitude.toInt(),
      "lng":latLng.longitude.toInt()
    };
  }

  bool canAddTaskToDatabase() {
    if (placeName.isEmpty) return false;
    if (placeCategory.name.isEmpty) return false;
    if (stage.isEmpty) return false;
    if (flatNumber.isEmpty) return false;
    if (entrance.isEmpty) return false;
    if (orientAddress.isEmpty) return false;
    return true;
  }

  static PlaceModel initialValue = PlaceModel(
    placeName: "",
    entrance: "",
    placeCategory: PlaceCategory.home,
    latLng:const LatLng(0,0),
    flatNumber: "",
    stage: "",
    orientAddress: ""
  );
}

PlaceCategory getStatus(String statusText) {
  switch (statusText) {
    case "other":
      {
        return PlaceCategory.other;
      }
    case "work":
      {
        return PlaceCategory.work;
      }
    default:
      {
        return PlaceCategory.home;
      }
  }

}
