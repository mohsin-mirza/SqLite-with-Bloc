import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_with_bloc/presentation/pages/city_screen.dart';
import 'package:sqlite_with_bloc/presentation/pages/home_screen.dart';
import 'package:sqlite_with_bloc/presentation/pages/setting_screen.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  String name = 'Hi SQLite';
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CityScreen(),
    const SettingScreen(),
  ];
  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
  }
}
