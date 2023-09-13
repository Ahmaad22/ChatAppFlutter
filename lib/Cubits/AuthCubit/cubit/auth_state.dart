part of 'auth_cubit.dart';

@immutable
 class AuthState {}

 class AuthInitial extends AuthState {}

class IsLoading extends AuthState{}
class Failure extends AuthState{
  String errorMessage;
  Failure({required this.errorMessage});
}
class Initial extends AuthState{}
class Success extends AuthState{}
