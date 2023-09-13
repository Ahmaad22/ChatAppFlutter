import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/Bloc/bloc/auth_bloc.dart';
import 'package:scholarchat/Components/TextFieldComp.dart';
import 'package:scholarchat/Constants/Const.dart';
import 'package:scholarchat/Cubits/ChatCubit/ChatCubit.dart';
import 'package:scholarchat/Screens/Register.dart';
import 'package:scholarchat/Screens/chatPage.dart';

import '../Components/ButtonComp.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

 

  String? email;
  String? password;
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listener: (context, state) {
        if(state is LoginIsLoading)
        {
        isloading=true;
        }else if(state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getMessagees();
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return chatPage(email: email);
    
          }));
        }else if(state is LoginFailure){
          ShowSnack(context, state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              SizedBox(height: 90),
              Center(child: Image.asset("assets/image/scholar.png")),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Scholar Chat",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Pacifico-Regular.ttf",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextFieldComp(hint: "Email",
              onChanged:(value){
                email= value;
              },
              ),
              SizedBox(height: 15),
              TextFieldComp(hint: "Password",
              obsecuredText: true,
              onChanged:(value){
                password= value;
              },
              ),
              SizedBox(height: 15),
              ButtonComp(
                buttonText: "Sign In",
                onTap: () async {
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!));
                  
                },
              ),
          const    SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 60),
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                const  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xffD0F4F0), fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  void ShowSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
