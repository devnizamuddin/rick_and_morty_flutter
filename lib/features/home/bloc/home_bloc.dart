import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../landing/bloc/landing_page_bloc.dart';
import '../../../models/character_model.dart';
import '../../../repository/character_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCharacterInitialFetchEvent>(homeCastInitialFetchEvent);
    on<HomeViewAllCharacterActionEvent>(homeViewAllCharacterActionEvent);
  }

  Future homeCastInitialFetchEvent(event, emit) async {
    emit(HomeCharacterFetchingLoading());
    CharacterRepository characterRepository = CharacterRepository();
    List<CharacterModel>? characterModelList =
        await characterRepository.fetchCharacter();
    if (characterModelList != null) {
      emit(HomeCharacterFetchingSuccess(characterModelList));
    } else {
      emit(HomeCharacterFetchingError('Character can not be loaded'));
    }
  }

  FutureOr<void> homeViewAllCharacterActionEvent(event, emit) {
    BlocProvider.of<LandingPageBloc>(event.context).add(TabChange(tabIndex: 1));
  }
}
