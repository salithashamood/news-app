import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/login_page/cubit/login_cubit.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Container(
      width: 85.w,
      padding: const EdgeInsets.all(16),
      // height: size.height * 0.60,
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: boldTextStyle,
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Name',
                  focusedBorder: loginFocuseBorder,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: secondryColor,
                  ),
                  contentPadding: loginContentPadding,
                  border: loginBorder),
            ),
            SizedBox(
              height: 4.h,
            ),
            TextFormField(
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
              height: 4.h,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
              onPressed: () {},
              child: const Text(
                'Sign Up',
                style: boldTextStyle,
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Do have an account ?'),
                TextButton(
                    onPressed: () {
                      loginCubit.tapLoginButton();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: secondryColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
