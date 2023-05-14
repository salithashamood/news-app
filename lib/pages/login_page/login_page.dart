import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home_page/cubit/home_page_cubit.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/pages/loading_page/cubit/loading_page_cubit.dart';
import 'package:news_app/pages/loading_page/loading_page.dart';
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
              BlocConsumer<LoginCubit, LoginState>(
                buildWhen: (previous, current) {
                  if (current is LoginFailier || current is LoginLoading) {
                    return false;
                  } else {
                    return true;
                  }
                },
                listener: (context, state) {
                  if (state is LoginFailier) {
                    final snackBar = SnackBar(
                      backgroundColor: secondryColor,
                      content: Text(state.error),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is LoginSucsess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => LoadingPageCubit(),
                            child: LoadingPage(),
                          ),
                        ));
                  }
                },
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
