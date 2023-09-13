import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/Bloc/bloc/auth_bloc.dart';
import 'package:scholarchat/Cubits/AuthCubit/cubit/auth_cubit.dart';
import 'package:scholarchat/Cubits/ChatCubit/ChatCubit.dart';
import 'package:scholarchat/Screens/SignIn.dart';
import 'package:scholarchat/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
              BlocProvider(create:  (BuildContext context) => AuthCubit()),

                 BlocProvider(create:  (BuildContext context) => AuthBloc()),

    BlocProvider(create:  (BuildContext context) => ChatCubit()),

   
      ],

      child: MaterialApp(
    debugShowCheckedModeBanner: false,
       home: SignIn(),
      ),
    );
  }
}
