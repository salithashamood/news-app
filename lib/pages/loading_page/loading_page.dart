import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/loading_page/cubit/loading_page_cubit.dart';
import 'package:news_app/theme/theme.dart';

import '../home_page/cubit/home_page_cubit.dart';
import '../home_page/home_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoadingPageCubit, LoadingPageState>(
        listener: (context, state) {
          if (state is LoadingPageLoaded) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => HomePageCubit(state.latestNews, state.categoryNews),
                    child: const HomePage(),
                  ),
                ),);
          }
        },
        child: Center(child: CircularProgressIndicator(color: secondryColor,)),
      ),
    );
  }
}
