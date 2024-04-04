import 'package:homework12/data/models/note_model.dart';

abstract class NoteEvent {}

class SaveNoteEvent extends NoteEvent{
  final NoteModel noteModel;
  SaveNoteEvent({required this.noteModel});
}

class GetNotesEvent extends NoteEvent {}

class DeleteNoteEvent extends NoteEvent {
  final int noteId;
  DeleteNoteEvent({required this.noteId});
}

class UpdateNoteEvent extends NoteEvent {
  final int noteId;
  final NoteModel noteModel;
  UpdateNoteEvent({required this.noteId,required this.noteModel});
}
