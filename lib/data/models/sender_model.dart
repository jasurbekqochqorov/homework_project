class SenderModel{
  String name;
  String image;
  String location;

  SenderModel({
    required this.name,
    required this.location,
    required this.image
});


  factory SenderModel.fromJson(Map<String,dynamic> json){
    return SenderModel(
        name: json['name'] as String? ?? "",
        location:json['location'] as String? ?? "",
        image: json['brand_image'] as String? ?? "" );
  }
}