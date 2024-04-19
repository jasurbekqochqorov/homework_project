part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();
}

class GetAllNumber extends GameEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class CheckBox extends GameEvent {
  const CheckBox( {required this.index,required this.k});

  final int index;
  final int k;

  @override
  List<Object?> get props => [];
}
class Check extends GameEvent {
  const Check();
  @override
  List<Object?> get props => [];
}

