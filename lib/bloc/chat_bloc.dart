import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';
import 'package:homework12/bloc/chat_state.dart';
import 'package:homework12/model/contact_model.dart';
import '../firebase/firebase_service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  FirebaseService firebaseService = FirebaseService();
  ChatBloc() :
        super(
         InitialState())
      {
    on<AddContact>(addContact);
    on<DownloadAll>(all);
    on<AddMessage>(addMessage);
  }
  all(DownloadAll event,emit)async{
    debugPrint("MESSAGE:");
    emit(InitialState());
    final msg=await firebaseService.getMessages().first;
    debugPrint("MESSAGE:$msg");
    final cont=await firebaseService.getContact().first;
    emit(DownloadAllState(contacts:cont, messages:msg));
  }
  addMessage(AddMessage event,emit)async{
    emit(InitialState());
    await firebaseService.addMessage(event.messageModel);
    add(DownloadAll());
  }
  addContact(AddContact event,emit)async{
    emit(InitialState());
    await firebaseService.addContact(event.contactModel);
    add(DownloadAll());
  }

}