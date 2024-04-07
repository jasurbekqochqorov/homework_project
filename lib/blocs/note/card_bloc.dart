import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/local/local_database.dart';
import 'package:homework12/data/models/note_model.dart';
import 'card_event.dart';
import 'card_state.dart';

class CardBloc extends Bloc<NoteEvent,NoteState> {
  CardBloc():super(CurrencyInitialState()){
  on<SaveNoteEvent>(_saveNote);
  on<GetNotesEvent>(_getNotes);
  on<DeleteNoteEvent>(_deleteNotes);
  on<UpdateNoteEvent>(_updateNotes);
  }

  Future<void> _saveNote (
      SaveNoteEvent event,
      Emitter<NoteState> emit,
      )async{
    await LocalDatabase.insertTask(event.noteModel);
    add(GetNotesEvent());
  }

  Future<void> _getNotes(
      GetNotesEvent event,
      Emitter<NoteState> emit,
      )async{
    emit(CurrencyInitialState());
    List<NoteModel> note=[];
    note=await LocalDatabase.getAllTasks();
    if(note==[]){
      emit(CurrencySuccessState(notes: []));
    }
    else{
    emit(CurrencySuccessState(notes:note));
    }
  }

  Future<void> _deleteNotes(
      DeleteNoteEvent event,
      Emitter<NoteState> emit,
      )async{
    emit(CurrencyInitialState());
    await LocalDatabase.deleteTask(event.noteId);
    add(GetNotesEvent());
  }

  Future<void> _updateNotes(
      UpdateNoteEvent event,
      Emitter<NoteState> emit,
      )async{
    emit(CurrencyInitialState());
    await LocalDatabase.updateTask(event.noteModel,event.noteId);
    add(GetNotesEvent());
  }

}
