part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppRouteToHomePage extends AppState {}

class AppRouteToLoginPage extends AppState {}

class AppRouteToLoadingPage extends AppState {}

class AppRouteToNewsViewPage extends AppState {}

class AppRouteToFavouritePage extends AppState {}

class AppRouteToProfilePage extends AppState {}
