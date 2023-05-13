import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {});
  }

  void loadingPage() {
    emit(AppRouteToLoadingPage());
  }

  void homePage() {
    emit(AppRouteToHomePage());
  }

  void loginPage() {
    emit(AppRouteToLoginPage());
  }

  void profilePage() {
    emit(AppRouteToProfilePage());
  }

  void favouritePage() {
    emit(AppRouteToFavouritePage());
  }

  void newsViewPage() {
    emit(AppRouteToNewsViewPage());
  }
}
