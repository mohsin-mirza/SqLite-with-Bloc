import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_with_bloc/presentation/bloc/app_cubit/app_cubit.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(cubit.name),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      cubit.increaNumber();
                    },
                    child: const Icon(Icons.add),
                  ),
                  Text(cubit.number.toString()),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      cubit.decreaseNumber();
                    },
                    child: const Icon(Icons.minimize),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
