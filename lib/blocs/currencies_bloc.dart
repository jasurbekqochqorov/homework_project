import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/currencies_repo.dart';
import '../data/models/currency_model.dart';
import 'currencies_event.dart';
import 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  CurrenciesBloc({required this.currenciesRepo})
      : super(CurrenciesInitialState()) {
    on<GetCurrenciesEvent>((event, emit) async {
      emit(CurrenciesLoadingState());
      List<CurrencyModel> list = await currenciesRepo.getCurrencies();
      if (list.isEmpty) {
        emit(CurrenciesErrorState("Something went wrong"));
      } else {
        emit(
          CurrenciesSuccessState(
            currencies: list,
          ),
        );
      }
    });
  }

  final CurrenciesRepo currenciesRepo;
}
