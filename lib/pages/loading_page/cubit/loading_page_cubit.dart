import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:utilities/utilities.dart';

part 'loading_page_state.dart';

class LoadingPageCubit extends Cubit<LoadingPageState> {
  LoadingPageCubit() : super(LoadingPageInitial()) {
    fetchNews();
  }

  Future<News> getLatestNews() async {
    Map<String, dynamic> params = {
      'country': 'us',
      'apiKey': 'c58834a043a74a7ea7cc6da32d9720c0'
    };
    final response =
        await ApiClient.instance.requestApi(baseUrl + headLines, params);
    return News.fromJson(response.data);
  }

  Future<News> getNewsByCategory(String category) async {
    Map<String, dynamic> params = {
      'q': category,
      'apiKey': 'c58834a043a74a7ea7cc6da32d9720c0'
    };
    final response =
        await ApiClient.instance.requestApi(baseUrl + everything, params);
    return News.fromJson(response.data);
  }

  fetchNews() async {
    emit(LoadingPageLoading());
    News latestNews = await getLatestNews();
    News categoryNews = await getNewsByCategory('technology');
    emit(LoadingPageLoaded(categoryNews, latestNews));
  }
}
