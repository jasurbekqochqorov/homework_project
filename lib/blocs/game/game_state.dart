part of 'game_bloc.dart';

class GameState extends Equatable {
  final List<NumberSquareModel> allNumbers;
  final bool isWin;

  const GameState({required this.isWin, required this.allNumbers,});

  GameState copyWith({
    List<NumberSquareModel>? allNumbers,
    bool? isWin,
  }) {
    return GameState(
      allNumbers: allNumbers ?? this.allNumbers,
      isWin: isWin ?? this.isWin,
    );
  }

  @override
  // TODO: implement props
  List get props => [allNumbers, isWin];
}
