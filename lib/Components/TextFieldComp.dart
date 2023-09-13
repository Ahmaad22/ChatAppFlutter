import 'package:flutter/material.dart';

class TextFieldComp extends StatelessWidget {
   TextFieldComp({this.onChanged,required this.hint,this.obsecuredText=false});
String hint;
Function(String)? onChanged;
bool? obsecuredText;
  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child:   TextFormField(
    obscureText: obsecuredText!,
    validator: (value){
      if(value!.isEmpty){
        return "Field is required";
      }
    },
    onChanged: onChanged,
    decoration: InputDecoration(
  hintText: hint,
  hintStyle: TextStyle(
    color: Colors.white,
    fontSize: 16,
  ),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white) ),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  
  
    ),
  ),
);
  }
}