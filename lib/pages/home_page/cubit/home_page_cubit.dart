import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:utilities/utilities.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.latestNews, this.categoryNews) : super(HomePageInitial());

  final News latestNews;
  News categoryNews;

  List category = [
    'technology',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'business'
  ];
  String selectedCategory = 'technology';

  // Future<void> getLatestNews() async {
  //   emit(HomePageDataLoading());
  //   Map<String, dynamic> params = {
  //     'country': 'us',
  //     'apiKey': 'c58834a043a74a7ea7cc6da32d9720c0'
  //   };
  //   final response =
  //       await ApiClient.instance.requestApi(baseUrl + headLines, params);
  //   latestNews = News.fromJson(response.data);
  //   emit(HomePageDataLoaded());
  // }

  Future<void> getNewsByCategory(String category) async {
    emit(HomePageCategoryNewsLoading());
    Map<String, dynamic> params = {
      'q': category,
      'apiKey': 'c58834a043a74a7ea7cc6da32d9720c0'
    };
    final response =
        await ApiClient.instance.requestApi(baseUrl + everything, params);
    categoryNews = News.fromJson(response.data);
    emit(HomePageCategoryNewsLoaded());
  }

  tappedCategory(String tapped) {
    selectedCategory = tapped;
    getNewsByCategory(selectedCategory);
  }
}
