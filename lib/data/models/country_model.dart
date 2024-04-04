import 'package:homework12/data/models/continent_model.dart';
class IncomesModel {
  IncomesModel({
    required this.data,
    required this.transferDate
  });
  String transferDate;
  List<DataModel> data;

  factory IncomesModel.fromJson(Map<String,dynamic> json){
    return IncomesModel(
      transferDate: json['transfer_date'] as String? ??  "",
      data:(json['data'] as List?)?.map((e) =>DataModel.fromJson(e)).toList()  ?? []);

  }
}
