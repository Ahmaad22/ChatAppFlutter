import 'package:flutter/material.dart';
import 'package:scholarchat/Constants/Const.dart';
import 'package:scholarchat/models/Message.dart';

class BubbleChat extends StatelessWidget {
   BubbleChat({super.key,required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)
            )
          ),
          
            child: Padding(
              padding: const EdgeInsets.only(left: 8,top: 16,bottom: 16,right: 16),
              child: Text(message.messages,style: TextStyle(
                color: Colors.white,
              ),),
            ),
          )),
      
    );
  }
}

class BubbleChatFromAnother extends StatelessWidget {
   BubbleChatFromAnother({super.key,required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)
            )
          ),
          
            child: Padding(
              padding: const EdgeInsets.only(left: 8,top: 16,bottom: 16,right: 16),
              child: Text(message.messages,style: TextStyle(
                color: Colors.white,
              ),),
            ),
          )),
      
    );
  }
}