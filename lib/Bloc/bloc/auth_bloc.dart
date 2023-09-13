import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{

if(event is LoginEvent){
 emit(LoginIsLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: "User not Found"));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: "Wrong Password"));
      } else {
        emit(LoginFailure(errorMessage: "Something went wrong"));
      }

}}}

    );
  
  }
}
