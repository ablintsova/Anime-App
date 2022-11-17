import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_info_event.dart';
part 'anime_info_state.dart';

class AnimeInfoBloc extends Bloc<AnimeInfoEvent, AnimeInfoState> {
  AnimeInfoBloc() : super(AnimeInfoInitial()) {
    on<AnimeInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
