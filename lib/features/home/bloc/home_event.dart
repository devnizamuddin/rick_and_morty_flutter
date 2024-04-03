part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeCharacterInitialFetchEvent extends HomeEvent {}

final class HomeViewAllCharacterActionEvent extends HomeEvent {
  final BuildContext context;
  HomeViewAllCharacterActionEvent({required this.context});
}
