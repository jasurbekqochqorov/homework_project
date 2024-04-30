abstract class CurrencyEvent {}

class GetCurrenciesEvent extends CurrencyEvent {}

class DeleteCurrencyEvent extends CurrencyEvent {
  final String currencyId;

  DeleteCurrencyEvent({required this.currencyId});
}
