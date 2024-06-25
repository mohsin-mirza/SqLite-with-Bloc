import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  String name = 'Hi SQLite';
  int number = 0;
  void increaNumber() {
    number++;
    emit(IncreaseNumberState());
  }

  void decreaseNumber() {
    number--;
    emit(DecreaseNumberState());
  }
}
