import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/login_page/cubit/login_cubit.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 50),
            child: Center(
              child: CircularProgressIndicator(color: secondryColor),
            ),
          );
        } else {
          return Container(
            width: 85.w,
            padding: const EdgeInsets.all(16),
            // height: size.height * 0.60,
            child: Form(
              key: loginCubit.signInFormKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: boldTextStyle,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value!.isEmpty ? 'Field Cannot be empty' : null;
                    },
                    onChanged: (value) => loginCubit.emailChanged(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        focusedBorder: loginFocuseBorder,
                        prefixIcon: const Icon(
                          Icons.mail_rounded,
                          color: secondryColor,
                        ),
                        contentPadding: loginContentPadding,
                        border: loginBorder),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value!.isEmpty ? 'Field Cannot be empty' : null;
                    },
                    onChanged: (value) => loginCubit.passwordChanged(value),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: loginFocuseBorder,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: secondryColor,
                        ),
                        contentPadding: loginContentPadding,
                        border: loginBorder),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await loginCubit.login();
                    },
                    child: const Text(
                      'Login',
                      style: boldTextStyle,
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Don\'t have an account ?'),
                      TextButton(
                          onPressed: () {
                            loginCubit.tapSignUpButton();
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: secondryColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
