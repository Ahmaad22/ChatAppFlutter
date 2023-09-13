import 'package:scholarchat/Constants/Const.dart';

class Message{
  final String messages;
 final String id;

  Message( this.messages, this.id);
  
  factory Message.fromJson(jsonData){

return Message(jsonData[kmessage], jsonData["id"]);
  }
}