import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:utilities/utilities.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
    });
  }

  setInitialPage() async {
    String? email = await SecureStorage.getEmail();
    String? name = await SecureStorage.getName();
    if (email != null && name != null) {
      homePage();
    } else {
      loginPage();
    }
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
