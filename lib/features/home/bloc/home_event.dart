part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeCharacterInitialFetchEvent extends HomeEvent {}
