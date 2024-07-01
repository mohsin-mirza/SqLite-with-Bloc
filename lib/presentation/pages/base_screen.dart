import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_with_bloc/presentation/bloc/app_cubit/app_cubit.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text(
              'SQLite With Bloc',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_city), label: 'City'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ],
            onTap: (index) {
              cubit.changeScreen(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
