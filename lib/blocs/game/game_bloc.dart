import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/number_square_model.dart';
import 'package:homework12/data/repositories/game_repository.dart';
part 'game_event.dart';
part 'game_state.dart';
class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(
           const CheckState(
            allNumbers:[],
            k:0,
          ),
        ) {
    on<CheckWins>(check);
    on<GetAllNumber>(getAll);
  }
  getAll(GetAllNumber event,emit){
    questions.shuffle();
    debugPrint("A");
    emit(CheckState(allNumbers:questions, k:-1));
  }
  check(CheckWins event, emit){
    if (event.index > 3) {
      if (event.questions[event.index - 4].isFilled) {
        event.questions[event.index - 4] = event.questions[event.index - 4]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
        event.questions[event.index] =
            event.questions[event.index].copyWith(number: '', isFilled: true);
      }
      else if (event.questions[event.index - 1].isFilled && event.index - 1 >= 0) {
        event.questions[event.index - 1] = event.questions[event.index - 1]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
        event.questions[event.index] =
            event.questions[event.index].copyWith(number: '', isFilled: true);
      }
      else if (event.questions[event.index + 1].isFilled &&
          event.index + 1 < event.questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == event.questions.length - 1)) {
        event.questions[event.index + 1] = event.questions[event.index + 1]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
        event.questions[event.index] =
            event.questions[event.index].copyWith(number: '', isFilled: true);
      } else if (event.questions[event.index + 4].isFilled &&
          event.index + 4 <= event.questions.length - 1) {
        event.questions[event.index + 4] = event.questions[event.index + 4]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
        event.questions[event.index] =
            event.questions[event.index].copyWith(number: '', isFilled: true);
      } else {
      }
    } else if(event.index>0){
     if (event.questions[event.index - 1].isFilled && event.index - 1 >= 0) {
       event.questions[event.index - 1] = event.questions[event.index - 1]
        .copyWith(number: event.questions[event.index].number, isFilled: false);
       event.questions[event.index] =
           event.questions[event.index].copyWith(number: '', isFilled: true);
    }
    else if (event.questions[event.index + 1].isFilled &&
          event.index + 1 < event.questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == event.questions.length - 1)) {
       event.questions[event.index + 1] = event.questions[event.index + 1]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
       event.questions[event.index] =
           event.questions[event.index].copyWith(number: '', isFilled: true);
      } else if (event.questions[event.index + 4].isFilled &&
          event.index + 4 <= event.questions.length - 1) {
       event.questions[event.index + 4] = event.questions[event.index + 4]
            .copyWith(number: event.questions[event.index].number, isFilled: false);
       event.questions[event.index] =
           event.questions[event.index].copyWith(number: '', isFilled: true);
      }
    }
    else{
     if (event.questions[event.index + 1].isFilled &&
    event.index + 1 < event.questions.length &&
    (((event.index + 1) % 4 != 0) ||
    event.index + 1 == event.questions.length - 1)) {
       event.questions[event.index + 1] = event.questions[event.index + 1]
        .copyWith(number: event.questions[event.index].number, isFilled: false);
    } else if (event.questions[event.index + 4].isFilled &&
    event.index + 4 <= event.questions.length - 1) {
       event.questions[event.index + 4] = event.questions[event.index + 4]
        .copyWith(number: event.questions[event.index].number, isFilled: false);
    event.questions[event.index] =
        event.questions[event.index].copyWith(number: '', isFilled: true,);
    }
    }
    bool isWin = true;
    for (int i = 1; i < event.questions.length-1; i++) {
      if (true) {
        isWin = false;
      }
    }
    if (isWin) {
      emit(const CheckWin());
    } else {
      debugPrint("KELDI");
      int k=event.k;
      k=k+1;
      emit(CheckState(allNumbers: event.questions,k: 10));
    }
  }
  }
