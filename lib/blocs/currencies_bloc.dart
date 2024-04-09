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
      List<ProductModel> list = await currenciesRepo.getCurrencies();
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
    on<DeleteCurrenciesEvent>((event,emit)async{
     await currenciesRepo.deleteCurrencies(event.id);
     emit(CurrenciesLoadingState());
     emit(CurrenciesSuccessState(currencies: await currenciesRepo.getCurrencies()));
      });

    on<AddCurrenciesEvent>((event,emit)async{
      emit(CurrenciesLoadingState());
      await currenciesRepo.addCurrencies(event.productModel);

      emit(CurrenciesSuccessState(currencies: await currenciesRepo.getCurrencies()));
    });

    on<UpdateCurrenciesEvent>((event,emit)async{
      await currenciesRepo.updateCurrencies(event.productModel);
      emit(CurrenciesLoadingState());
      emit(CurrenciesSuccessState(currencies: await currenciesRepo.getCurrencies()));
    });
  }

  final CurrenciesRepo currenciesRepo;
}
