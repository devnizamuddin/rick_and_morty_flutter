part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCharacterFetchingLoading extends HomeState {}

final class HomeCharacterFetchingSuccess extends HomeState {
  final List<CharacterModel> characterModelList;
  HomeCharacterFetchingSuccess(this.characterModelList);
}

final class HomeCharacterFetchingError extends HomeState {
  final String errorMessage;
  HomeCharacterFetchingError(this.errorMessage);
}
