import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home_page/cubit/home_page_cubit.dart';
import 'package:news_app/pages/news_page/cubit/news_page_cubit.dart';
import 'package:news_app/pages/news_page/news_page.dart';
import 'package:news_app/theme/theme.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageCubit = context.read<HomePageCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 75.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search_sharp),
                      contentPadding: const EdgeInsets.all(5),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)))),
                )),
            const Icon(
              Icons.notifications,
              color: secondryColor,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Latest News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () async {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => NewsPageCubit(
                                    homePageCubit.latestNews.articles![index]),
                                child: NewsPage(),
                              ),
                            ));
                      },
                      child: Card(
                        key: UniqueKey(),
                        color: secondryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: Stack(
                          children: [
                            homePageCubit.setImage(homePageCubit
                                    .latestNews.articles![index].urlToImage ??
                                null),
                            Positioned(
                              top: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Text(
                                    homePageCubit
                                        .latestNews.articles![index].title!,
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<HomePageCubit, HomePageState>(
              buildWhen: (previous, current) {
                if (current is HomePageCategoryNewsLoading) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: 50,
                  width: 100.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homePageCubit.category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            homePageCubit
                                .tappedCategory(homePageCubit.category[index]);
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: homePageCubit.selectedCategory ==
                                        homePageCubit.category[index]
                                    ? secondryColor
                                    : primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                homePageCubit.category[index],
                                style: TextStyle(
                                    color: homePageCubit.selectedCategory ==
                                            homePageCubit.category[index]
                                        ? primaryColor
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<HomePageCubit, HomePageState>(
              buildWhen: (previous, current) {
                if (current is HomePageCategoryNewsLoaded ||
                    current is HomePageCategoryNewsLoading) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is HomePageCategoryNewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: secondryColor),
                  );
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homePageCubit.categoryNews.articles!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 90.w,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => NewsPageCubit(
                                          homePageCubit
                                              .categoryNews.articles![index]),
                                      child: NewsPage(),
                                    ),
                                  ));
                            },
                            child: Card(
                              key: UniqueKey(),
                              color: secondryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 1,
                              child: Stack(
                                children: [
                                  homePageCubit.setImage(homePageCubit
                                          .categoryNews
                                          .articles![index]
                                          .urlToImage ??
                                      null),
                                  Positioned(
                                    top: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 300,
                                        child: Text(
                                          homePageCubit.categoryNews
                                              .articles![index].title!,
                                          style: const TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
