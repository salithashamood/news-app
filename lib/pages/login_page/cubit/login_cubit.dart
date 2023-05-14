import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_database/local_database.dart';
import 'package:news_app/pages/login_page/widgets/sign_in.dart';
import 'package:utilities/utilities.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isEmailValid = false;
  bool isPasswordMatch = false;
  String name = '';
  String email = '';
  String password = '';
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  void emailChanged(String value) {
    isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    email = value;
  }

  void nameChanged(String value) {
    name = value;
  }

  void passwordChanged(String value) {
    password = value;
  }

  void confirmPasswordChanged(String value) {
    if (value == password) {
      isPasswordMatch = true;
    } else {
      isPasswordMatch = false;
    }
  }

  void tapLoginButton() {
    emit(LoginTappedLogin());
  }

  void tapSignUpButton() {
    emit(LoginTappedSignUp());
  }

  Future<void> createAccount() async {
    emit(LoginLoading());
    if (signUpFormKey.currentState!.validate()) {
      if (isPasswordMatch) {
        User user = User(email: email, name: name, password: password);
        User createdUser = await UserDatabase.instance.saveUser(user);
        if (createdUser != null) {
          await SecureStorage.setEmail(createdUser.email);
          await SecureStorage.setName(createdUser.name);
          emit(LoginSucsess());
        } else {
          emit(LoginFailier('User cannot register. Please try again'));
        }
      } else {
        emit(LoginFailier('Passwords not match'));
      }
    } else {
      emit(LoginFailier('Register Form not validated'));
    }
  }

  Future<void> login() async {
    emit(LoginLoading());
    if (signInFormKey.currentState!.validate()) {
      User user = User(email: email, password: password);
      User getUser = await UserDatabase.instance.getUserWithEmail(user.email);
      if (getUser != null) {
        if (getUser.password == user.password) {
          await SecureStorage.setEmail(getUser.email);
          await SecureStorage.setName(getUser.name);
          emit(LoginSucsess());
        } else {
          emit(LoginFailier('Invalide email or password'));
        }
      } else {
        emit(LoginFailier('Invalide email or password'));
      }
    } else {
      emit(LoginFailier('Login Form not validated'));
    }
  }
}
