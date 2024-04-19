import 'package:homework12/data/model/game_model.dart';

abstract class GameEvent {}

class SaveEvent extends GameEvent{
  List<GameModel> games;
  SaveEvent({required this.games});
}

class GetEvent extends GameEvent {}

class UpdateNoteEvent extends GameEvent {
  final String question;
  final int noteId;
  UpdateNoteEvent({required this.noteId,required this.question});
}