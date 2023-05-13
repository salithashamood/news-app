import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/login_page/cubit/login_cubit.dart';
import 'package:news_app/pages/login_page/widgets/sign_in.dart';
import 'package:news_app/pages/login_page/widgets/sign_up.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
                width: 80.w,
                height: 30.h,
                child: Image.asset(
                  'assets/icons/logo.jpg',
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LoginTappedLogin) {
                    return SignIn();
                  }
                  if (state is LoginTappedSignUp) {
                    return SignUp();
                  }
                  return SignIn();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
