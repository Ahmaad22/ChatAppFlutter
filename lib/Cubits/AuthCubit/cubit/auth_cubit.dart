import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  
  Future<void> userRegiter({required String email,required String password}) async
   {
    emit(IsLoading());
     try {

  UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    emit(Success());

} 
  on FirebaseAuthException catch (ex){
          if(ex.code=='weak-password'){
              emit(Failure(errorMessage: "Weak Password"));        
          }
          else if(ex.code=='email-already-in-use')
          {
              emit(Failure(errorMessage: "email-already-in-use"));        
              }
        
       else{
         emit(Failure(errorMessage: "SomeThing went Wrong"));
       }
}
  }

 Future<void> login({required String email, required String password}) async {
    emit(IsLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Success());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(Failure(errorMessage: "User not Found"));
      } else if (ex.code == 'wrong-password') {
        emit(Failure(errorMessage: "Wrong Password"));
      } else {
        emit(Failure(errorMessage: "Something went wrong"));
      }
    }
  }


}
