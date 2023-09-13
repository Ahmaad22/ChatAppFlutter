part of 'auth_bloc.dart';

@immutable
 class AuthState {}

 class AuthInitial extends AuthState {}


class LoginIsLoading extends AuthState{}
class LoginFailure extends AuthState{
  String errorMessage;
  LoginFailure({required this.errorMessage});
}
class LoginSuccess extends AuthState{}

class RegestirIsLoading extends AuthState{}
class RegestirFailure extends AuthState{
  String errorMessage;
  RegestirFailure({required this.errorMessage});
}
class RegestirSuccess extends AuthState{}
