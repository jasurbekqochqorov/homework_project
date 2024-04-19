


import 'package:homework12/data/model/game_model.dart';

abstract class GameState {}

class CurrencySuccessState extends GameState {
  CurrencySuccessState({required this.questions});
  final GameModel questions;
}





