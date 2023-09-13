import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/Constants/Const.dart';
import 'package:scholarchat/Cubits/ChatCubit/ChatState.dart';
import 'package:scholarchat/models/Message.dart';

class ChatCubit extends Cubit<ChatState>{
  ChatCubit():super(InitialState());
 CollectionReference messages = FirebaseFirestore.instance.collection('messages');
void sendMessage({required String message,required String email})
{
  try {
  messages.add({
                
                "messages":message,
                kCreatedAt: DateTime.now(),
                "id":email
                
                });
} on Exception catch (e) {
  // TODO
}
}

void getMessagees()
{
  messages.orderBy(kCreatedAt,descending: true).snapshots().listen((event) {
List<Message> messagesList=[];

for(var doc in event.docs ){
  messagesList.add(Message.fromJson(doc));
}
  emit(ChatSuccess(messages: messagesList   ));
  });

}

}