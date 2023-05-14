import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/news_page/cubit/news_page_cubit.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsPageCubit = context.read<NewsPageCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                    height: 300,
                    width: 100.w,
                    child: newsPageCubit
                        .setImage(newsPageCubit.article.urlToImage ?? null)),
              ),
              Positioned(
                top: 250,
                child: Container(
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      color: primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 80.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              newsPageCubit.article.title!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              newsPageCubit.article.content!,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 5,
                child: Container(
                  decoration: const ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
