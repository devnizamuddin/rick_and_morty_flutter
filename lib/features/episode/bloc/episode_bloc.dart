import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeInitial()) {
    on<EpisodeEvent>((event, emit) {});
  }
}
