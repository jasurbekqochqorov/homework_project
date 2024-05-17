part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();
}

class GetAllNumber extends GameEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class CheckWins extends GameEvent {
  final int index;
  final List<NumberSquareModel> questions;
  const CheckWins({required this.questions,required this.index});

  @override
  List<Object?> get props => [
    questions,
    index
  ];
}

