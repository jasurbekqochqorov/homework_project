
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/model/game_model.dart';
import 'package:homework12/game/game_event.dart';
import 'package:homework12/game/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(CurrencySuccessState(
            questions: GameModel(
          answer: '',
          image1: '',
          image2: '',
          image3: '',
          image4: '',
          index: 0,
        ))) {
    on<GetEvent>(getQuestion);
    on<UpdateNoteEvent>(nextQuestion);
  }

  getQuestion(GetEvent event,emit){
    emit(CurrencySuccessState(questions:list[0]));
  }

  nextQuestion(UpdateNoteEvent event ,emit){
   if(list[event.noteId].answer==event.question){
     emit(CurrencySuccessState(questions: list[event.noteId+1]));
   }
   else{
     emit(CurrencySuccessState(questions: list[event.noteId]));
   }
  }
}
