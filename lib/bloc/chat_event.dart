

import 'package:equatable/equatable.dart';
import 'package:homework12/model/contact_model.dart';
import 'package:homework12/model/message_model.dart';

abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class DownloadAll extends ChatEvent{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class AddMessage extends ChatEvent{

  final MessageModel messageModel;

  const AddMessage({required this.messageModel});
  @override
  // TODO: implement props
  List<Object?> get props =>[messageModel];

}
class AddContact extends ChatEvent{

  final ContactModel contactModel;

  const AddContact({required this.contactModel});
  @override
  // TODO: implement props
  List<Object?> get props =>[contactModel];

}