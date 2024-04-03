import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui/cast_detail_screen.dart';
import '../../../models/character_detail_model.dart';

import '../../../repository/character_repository.dart';
part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<CastCharacterFetchEvent>(castCharacterFetchEvent);
    on<CastCharacterDetailPageNavigateEvent>(
        castCharacterDetailPageNavigateEvent);
  }

  Future<void> castCharacterFetchEvent(event, emit) async {
    emit(CastCharacterFetchingLoading());
    CharacterRepository characterRepository = CharacterRepository();
    List<CharacterDetailModel>? characterModelList =
        await characterRepository.fetchCharacterDetailWithPagination();
    if (characterModelList != null) {
      emit(CastCharacterFetchingSuccess(characterModelList));
    } else {
      emit(CastCharacterFetchingError('Character can not be loaded'));
    }
  }

  FutureOr<void> castCharacterDetailPageNavigateEvent(event, emit) {
    Navigator.pushNamed(event.context, CastDetailScreen.route,
        arguments: event.characterDetailModel);
  }
}
