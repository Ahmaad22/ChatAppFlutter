import 'package:scholarchat/models/Message.dart';

abstract class ChatState{}
class InitialState extends ChatState{}
class ChatSuccess extends ChatState{
  List<Message> messages;
  ChatSuccess({required this.messages});
}