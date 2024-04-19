part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState();

  @override
  // TODO: implement props
  List<NumberSquareModel> get props =>[];
}

class CheckState extends GameState{
  final List<NumberSquareModel> allNumbers;
  final int k;
  const CheckState({required this.allNumbers,required this.k});
}
class CheckWin extends GameState{
  const CheckWin();
}
