import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/bloc/app_bloc.dart';
import 'package:news_app/pages/login_page/login_page.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: BlocListener(
            listener: (context, state) {
              if (state is AppRouteToLoadingPage) {

              }
              if (state is AppRouteToHomePage) {
                
              }
              if (state is AppRouteToLoginPage) {
                
              }
            },
            child: LoginPage(),
          ));
    });
  }
}