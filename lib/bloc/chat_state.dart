import 'package:equatable/equatable.dart';
import 'package:homework12/model/contact_model.dart';

import '../model/message_model.dart';

abstract class  ChatState extends Equatable{
  const ChatState();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class InitialState extends ChatState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class DownloadAllState extends ChatState{
  final List<MessageModel> messages;
  final List<ContactModel> contacts;
  const DownloadAllState({
  required this.contacts,
  required this.messages});
  @override
  // TODO: implement props
  List<Object?> get props =>[
    contacts,messages
  ];
}