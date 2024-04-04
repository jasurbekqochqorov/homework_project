
import 'package:homework12/data/models/note_model.dart';


abstract class NoteState {}

class CurrencyInitialState extends NoteState {}

class CurrencyLoadingState extends NoteState {}

class CurrencyEmptyState extends NoteState {}

class CurrencySuccessState extends NoteState {
  CurrencySuccessState({required this.notes});
  final List<NoteModel> notes;
}

class CurrencyErrorState extends NoteState {
  CurrencyErrorState({required this.errorText});

  final String errorText;
}

class CurrencyDeletedState extends NoteState {}

