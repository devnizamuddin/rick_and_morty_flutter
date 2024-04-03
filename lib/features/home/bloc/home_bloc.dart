import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/models/character_model.dart';
import '../../../repository/character_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCharacterInitialFetchEvent>(homeCastInitialFetchEvent);
  }

  Future homeCastInitialFetchEvent(event, emit) async {
    emit(HomeCharacterFetchingLoading());
    CharacterRepository characterRepository = CharacterRepository();
    List<CharacterModel>? characterModelList =
        await characterRepository.fetchCharacter();
    if (characterModelList != null) {
      emit(HomeCharacterFetchingSuccess(characterModelList));
    } else {
      emit(HomeCharacterFetchingError());
    }
  }
}
