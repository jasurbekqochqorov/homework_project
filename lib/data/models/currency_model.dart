
class CurrencyModel {
  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuCellPrice;
  final String date;


  CurrencyModel({
    required this.title,
    required this.date,
    required this.cbPrice,
    required this.code,
    required this.nbuBuyPrice,
    required this.nbuCellPrice
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      title: json["title"] as String? ?? "",
      code: json["code"] as String? ?? "",
      date: json["date"] as String? ?? "",
      cbPrice: json["cb_price"] as String? ?? "",
      nbuCellPrice: json["nbu_cell_price"] as String? ?? "",
      nbuBuyPrice: json["nbu_buy_price"] as String? ?? "",
    );
  }


  Map<String,dynamic> toJson(){
    return {
      'title':title,
      "date":date,
      "code":code,
      "cb_price":cbPrice,
      "nbu_cell_price":nbuCellPrice,
      "nbu_buy_price":nbuBuyPrice
    };
  }
}
