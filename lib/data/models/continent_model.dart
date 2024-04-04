import 'package:homework12/data/models/sender_model.dart';

class DataModel{

  String date;
  int incomeId;
  double amount;
  int cardId;
  SenderModel sender;

  DataModel({
    required this.date,
    required this.amount,
    required this.cardId,
    required this.incomeId,
    required this.sender

});

  factory DataModel.fromJson(Map<String,dynamic> json){

    return DataModel(
        date:json['date'] as String? ?? "",
        incomeId: json['income_id'] as int? ?? 0,
        amount: json['amount'] as double? ?? 0.0,
        cardId: json['card_id'] as int? ?? 0,
      sender: SenderModel.fromJson(json['sender'])
    );
  }

}