part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginTappedLogin extends LoginState {}

class LoginTappedSignUp extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsess extends LoginState {}

class LoginFailier extends LoginState {
  final String error;
  LoginFailier(this.error);
}
