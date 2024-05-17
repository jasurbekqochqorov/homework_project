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
          const GameState(allNumbers: [], isWin: false),
        ) {
    on<CheckWins>(check);
    on<GetAllNumber>(getAll);
  }
  getAll(GetAllNumber event, emit) {
    questions.shuffle();
    emit(state.copyWith(allNumbers: questions));
  }
  check(CheckWins event, emit) async {
    if (event.index > 3) {
      if (questions[event.index - 4].isFilled) {
        questions[event.index - 4] = questions[event.index - 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else if (questions[event.index - 1].isFilled && event.index - 1 >= 0) {
        questions[event.index - 1] = questions[event.index - 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else if (questions[event.index + 1].isFilled &&
          event.index + 1 < questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == questions.length - 1)) {
        questions[event.index + 1] = questions[event.index + 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else if (questions[event.index + 4].isFilled &&
          event.index + 4 <= questions.length - 1) {
        questions[event.index + 4] = questions[event.index + 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else {}
    } else if (event.index > 0) {
      if (questions[event.index - 1].isFilled && event.index - 1 >= 0) {
        questions[event.index - 1] = questions[event.index - 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else if (questions[event.index + 1].isFilled &&
          event.index + 1 < questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == questions.length - 1)) {
        questions[event.index + 1] = questions[event.index + 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      } else if (questions[event.index + 4].isFilled &&
          event.index + 4 <= questions.length - 1) {
        questions[event.index + 4] = questions[event.index + 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] =
            questions[event.index].copyWith(number: '', isFilled: true);
      }
    } else {
      if (questions[event.index + 1].isFilled &&
          event.index + 1 < questions.length &&
          (((event.index + 1) % 4 != 0) ||
              event.index + 1 == questions.length - 1)) {
        questions[event.index + 1] = questions[event.index + 1]
            .copyWith(number: questions[event.index].number, isFilled: false);
      } else if (questions[event.index + 4].isFilled &&
          event.index + 4 <= questions.length - 1) {
        questions[event.index + 4] = questions[event.index + 4]
            .copyWith(number: questions[event.index].number, isFilled: false);
        questions[event.index] = questions[event.index].copyWith(
          number: '',
          isFilled: true,
        );
      }
    }
    bool isWin = true;
    for (int i = 1; i < event.questions.length - 1; i++) {
      if (true) {
        isWin = false;
      }
    }
    if (isWin) {
      await emit(state.copyWith(allNumbers: [], isWin: true));
    } else {
      debugPrint("EKD");
      await emit(state.copyWith(
        allNumbers: questions,
      ));
    }
  }
}
