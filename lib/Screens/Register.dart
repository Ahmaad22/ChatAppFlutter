import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/Cubits/AuthCubit/cubit/auth_cubit.dart';
import 'package:scholarchat/Screens/SignIn.dart';

import '../Components/ButtonComp.dart';
import '../Components/TextFieldComp.dart';
import '../Constants/Const.dart';

class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);


String? email ;

String? password;

bool isloading=false; 

GlobalKey<FormState> formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
      return BlocListener<AuthCubit,AuthState>(
        listener: (context, state) {
          if(state is IsLoading){
            isloading=true;
          }
          else if (state is Success)
          {
              Navigator.push(context, MaterialPageRoute(builder: (context){
            return SignIn();
      
          }));
          }
          else if(state is Failure){
            ShowSnack(context, state.errorMessage);
          }
        },
        child: ModalProgressHUD(
        
          inAsyncCall: isloading,
          child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Form(
            key: formkey,
            child: ListView(children: [
              SizedBox(height:90),
              Center(child: Image.asset("assets/image/scholar.png")),
             SizedBox(height:20),
              Center(
                child: Text("Scholar Chat",style: TextStyle(
                  fontSize: 32,
                  fontFamily: "Pacifico-Regular.ttf",
                  color:Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(children: [
                  Text("Sign Up",style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),)
                ],),
              )
          ,
          SizedBox(height: 10,),
          TextFieldComp(
           onChanged: (data){
          email=data;
           },
            hint: "Email"),
          SizedBox(height: 15),
          TextFieldComp( onChanged: (data){
          password =data;
           },hint: "Password",
            obsecuredText: true),
           
          SizedBox(height: 15),
          ButtonComp(onTap:()async{
          if (formkey.currentState!.validate()) {
         
           BlocProvider.of<AuthCubit>(context).userRegiter(email: email!, password: password!);
         
        }
        else{
          
        }
          
          
          
          
          }
          
          ,
            
            buttonText: "Sign Up"),
          SizedBox(height: 15),
          
          Row(
            children: [
           SizedBox(width: 60,),
              Text("Already have account?" ,style: TextStyle(color: Colors.white,fontSize: 16),),
            SizedBox(width: 5),
              GestureDetector(
                onTap: ()
                {
                  Navigator.pop(context);
                  }
                ,
                child: Text("Sign In",style: TextStyle(color:Color(0xffD0F4F0),fontSize: 16),))
            ],
          )
            ]),
          ),
            ),
        ),
      );
 
  }

  void ShowSnack(BuildContext context,String message) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  
}