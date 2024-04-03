part of 'cast_bloc.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastCharacterFetchingLoading extends CastState {}

final class CastCharacterFetchingSuccess extends CastState {
  final List<CharacterDetailModel> characterDetailModelList;
  CastCharacterFetchingSuccess(this.characterDetailModelList);
}

final class CastCharacterFetchingError extends CastState {
  final String errorMessage;
  CastCharacterFetchingError(this.errorMessage);
}
