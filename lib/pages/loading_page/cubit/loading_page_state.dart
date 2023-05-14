part of 'loading_page_cubit.dart';

@immutable
abstract class LoadingPageState {}

class LoadingPageInitial extends LoadingPageState {}

class LoadingPageLoading extends LoadingPageState {}

class LoadingPageLoaded extends LoadingPageState {
  News latestNews;
  News categoryNews;
  LoadingPageLoaded(this.categoryNews, this.latestNews);
}
