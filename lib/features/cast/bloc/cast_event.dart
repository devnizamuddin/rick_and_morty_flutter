part of 'cast_bloc.dart';

@immutable
sealed class CastEvent {}

final class CastCharacterFetchEvent extends CastEvent {}

final class CastCharacterDetailPageNavigateEvent extends CastEvent {
  final BuildContext context;
  final CharacterDetailModel characterDetailModel;
  CastCharacterDetailPageNavigateEvent(
      {required this.context, required this.characterDetailModel});
}
