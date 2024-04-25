


import 'package:equatable/equatable.dart';
import 'package:homework12/model/contact_model.dart';

import '../model/message_model.dart';

class ChatState extends Equatable{

  final List<MessageModel> messages;
  final List<ContactModel> contacts;

  const ChatState({
   required this.contacts,
   required this.messages
});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    messages,
    contacts
  ];

}