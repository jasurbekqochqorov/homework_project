part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();
}

class LoadQuestions extends GameEvent {
  @override
  List<Object?> get props => [];
}

class NextQuestions extends GameEvent {
  const NextQuestions();

  @override
  List<Object?> get props => [];
}

class CollectEnteredLetter extends GameEvent {
  const CollectEnteredLetter(this.letter);

  final String letter;

  @override
  List<Object?> get props => [letter];
}

class RemoveLetter extends GameEvent{
  final String letter;
  RemoveLetter({required this.letter});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
