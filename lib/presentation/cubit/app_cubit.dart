import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  Database? database;
  void createDataBase() async {
    //path here is the file name

    await openDatabase(
      'App.db',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE Student(Id INTEGER PRIMARY KEY,Title TEXT,Date TEXT,Time TEXT)')
            .then((onValue) {
          print('Table Create Successfullt');
        }).catchError((onError) {
          print(' Error Table Create Failed');
        });
      },
      onOpen: (db) {
        print('Database File is Opened');
      },
    ).then(
      (onValue) {
        database = onValue;
        emit(AppDataBaseCreateState());
        print(' //The Database File Successed to Open.');
      },
    ).catchError(
      (onError) {
        print('Error Open The Database File');
      },
    );
  }
}
///*********IF FACE THIS ISSUE Then Kill App And Run It Again *///
/* E/flutter (28395): #19     GestureBinding._handlePointerEventImmediately (package:flutter/src/gestures/binding.dart:420:7)
E/flutter (28395): #20     GestureBinding.handlePointerEvent (package:flutter/src/gestures/binding.dart:383:5)
E/flutter (28395): #21     GestureBinding._flushPointerEventQueue (package:flutter/src/gestures/binding.dart:330:7)
E/flutter (28395): #22     GestureBinding._handlePointerDataPacket (package:flutter/src/gestures/binding.dart:299:9)
E/flutter (28395): #23     _invoke1 (dart:ui/hooks.dart:328:13)
E/flutter (28395): #24     PlatformDispatcher._dispatchPointerDataPacket (dart:ui/platform_dispatcher.dart:442:7)
E/flutter (28395): #25     _dispatchPointerDataPacket (dart:ui/hooks.dart:262:31)
E/flutter (28395): 
24
I/gralloc4(28395): @set_metadata: update dataspace from GM (0x00000000 -> 0x08010000)*/