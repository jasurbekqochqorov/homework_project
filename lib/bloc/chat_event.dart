

import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable{
  const ChatEvent();
}

class DownloadAll extends ChatEvent{


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}