import 'dart:math';

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
          CheckState(
            allNumbers: questions,
            k:0,
          ),
        ) {
    on<Check>(checkWin);
    on<CheckBox>(check);
  }

  getNumbers(GetAllNumber event,emit){
    List<NumberSquareModel> list=[];
    int a=0;
    // bool q=list.where((element) => element.number!='1');
    for(int i=0; list.length<16; i++){

    }
  }

  check(CheckBox event, emit){
    if (event.index > 3) {
      if (questions[event.index - 4].isFilled) {
        questions[event.index - 4] = questions[event.index - 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      }
      else if (questions[event.index - 1].isFilled && event.index - 1 >= 0) {
        questions[event.index - 1] = questions[event.index - 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      }
      else if (questions[event.index + 1].isFilled &&
          event.index + 1 < questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == questions.length - 1)) {
        questions[event.index + 1] = questions[event.index + 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      } else if (questions[event.index + 4].isFilled &&
          event.index + 4 <= questions.length - 1) {
        questions[event.index + 4] = questions[event.index + 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      } else {
        emit(CheckState(allNumbers: questions,k: event.k+1));
      }
    } else if(event.index>0){
     if (questions[event.index - 1].isFilled && event.index - 1 >= 0) {
    questions[event.index - 1] = questions[event.index - 1]
        .copyWith(number: questions[event.index].number, isFilled: false);
    questions[event.index] =
    questions[event.index].copyWith(number: '', isFilled: true);
    emit(CheckState(allNumbers: questions,k: event.k+1));
    }
    else if (questions[event.index + 1].isFilled &&
          event.index + 1 < questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == questions.length - 1)) {
        questions[event.index + 1] = questions[event.index + 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      } else if (questions[event.index + 4].isFilled &&
          event.index + 4 <= questions.length - 1) {
        questions[event.index + 4] = questions[event.index + 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
        emit(CheckState(allNumbers: questions,k: event.k+1));
      }
    }
    else{
     if (questions[event.index + 1].isFilled &&
    event.index + 1 < questions.length &&
    (((event.index + 1) % 4 != 0) ||
    event.index + 1 == questions.length - 1)) {
    questions[event.index + 1] = questions[event.index + 1]
        .copyWith(number: questions[event.index].number, isFilled: false);
    questions[event.index] =
    questions[event.index].copyWith(number: '', isFilled: true);
    emit(CheckState(allNumbers: questions,k: event.k+1));
    } else if (questions[event.index + 4].isFilled &&
    event.index + 4 <= questions.length - 1) {
    questions[event.index + 4] = questions[event.index + 4]
        .copyWith(number: questions[event.index].number, isFilled: false);
    questions[event.index] =
    questions[event.index].copyWith(number: '', isFilled: true);
    emit(CheckState(allNumbers: questions,k: event.k+1));
    }
    }
  }
  checkWin(Check event, emit) {
    debugPrint("AAAAAAAAlllllllllllll");
    bool k = true;
    for (int i = 1; i < questions.length-1; i++) {
      if (int.parse(questions[i].number) -1 !=
          int.parse(questions[i-1].number)) {
        k = false;
      }
    }
    if (k) {
      emit(const CheckWin());
    } else {
      emit(CheckState(allNumbers: questions, k:0));
    }
  }
}
