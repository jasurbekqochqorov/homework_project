import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';
import 'package:homework12/bloc/chat_state.dart';
import 'package:homework12/model/contact_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() :
        super(
        const ChatState(contacts: [], messages: [],)
      ){
    on<DownloadAll>(all);
  }
  all(DownloadAll event,emit) async{
    emit(ChatState(contacts:contacts, messages:[]));
  }
}