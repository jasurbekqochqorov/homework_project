import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  int get onBoardingActiveIndex => state;

  increment() {
    emit(state + 1);
  }

  empty() {
    emit(0);
  }
}
