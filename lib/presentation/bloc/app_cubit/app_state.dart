part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class IncreaseNumberState extends AppState {}

final class DecreaseNumberState extends AppState {}

final class ChangeScreenState extends AppState {}
