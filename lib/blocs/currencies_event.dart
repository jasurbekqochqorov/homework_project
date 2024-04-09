import 'package:homework12/data/models/currency_model.dart';

abstract class CurrenciesEvent {}

class GetCurrenciesEvent extends CurrenciesEvent {}


class DeleteCurrenciesEvent extends CurrenciesEvent {
  final String id;
  DeleteCurrenciesEvent(this.id);
}



class AddCurrenciesEvent extends CurrenciesEvent {
  final ProductModel productModel;
  AddCurrenciesEvent(this.productModel);
}



class UpdateCurrenciesEvent extends CurrenciesEvent {
  final ProductModel productModel;
  UpdateCurrenciesEvent(this.productModel);
}


