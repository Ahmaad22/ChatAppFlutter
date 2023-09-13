import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/Constants/Const.dart';
import 'package:scholarchat/Cubits/ChatCubit/ChatCubit.dart';
import 'package:scholarchat/Cubits/ChatCubit/ChatState.dart';
import 'package:scholarchat/models/Message.dart';

import '../Components/BubbleChat.dart';
class chatPage extends StatelessWidget {

   chatPage({super.key,required this.email});
  var email;
  List<Message>messagesList=[];
TextEditingController controller=TextEditingController();
final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar( 
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Center( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(kLogo,height: 50,),
            Text("Chat"),
          ]),
        ),
        centerTitle: true,
      ),
    
    body: Column(
      children: [
        Expanded(
          child: BlocConsumer<ChatCubit,ChatState>(
            listener: (context , state){
              if(state is ChatSuccess)
                {
                messagesList=state.messages;  
                } 
                          },
            builder:((context, state) {
              return  ListView.builder(
              reverse: true,
              controller: scrollController,
              itemCount: messagesList.length,
              itemBuilder: (context,index){
                
             return messagesList[index].id == email
             ? BubbleChat(message: messagesList[index])
             : BubbleChatFromAnother(message: messagesList[index])   ;
                  
            }
                  
            );
            }) ,
           
          ),
        ),
      
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller
          ,
          onSubmitted: (data){
           BlocProvider.of<ChatCubit>(context).sendMessage(message: data, email: email);
            controller.clear();
            scrollController.animateTo(
              0,
              duration:const Duration(seconds: 1),
               curve: Curves.linear);
          },
          decoration: InputDecoration(
            hintText: "Send Message",
            suffixIcon: Icon(
              Icons.send,
              color: kPrimaryColor,
            )
            ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
            ,enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor)
            )
            ),
            
            ),
      )
      ],
    ),
    );
    
    }

      }
      