import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/bloc/app_bloc.dart';
import 'package:news_app/pages/home_page/home_page.dart';
import 'package:news_app/pages/login_page/cubit/login_cubit.dart';
import 'package:news_app/pages/login_page/login_page.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AppBloc>(
        create: (context) => AppBloc(),
      ),
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
      ),
    ], child: const AppInit());
  }
}

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().setInitialPage();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state is AppRouteToLoadingPage) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(color: secondryColor),
                  ),
                );
              }
              if (state is AppRouteToHomePage) {
                return const HomePage();
              }
              if (state is AppRouteToLoginPage) {
                return const LoginPage();
              }
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: secondryColor),
                ),
              );
            },
            // child: LoginPage(),
          ));
    });
  }
}
