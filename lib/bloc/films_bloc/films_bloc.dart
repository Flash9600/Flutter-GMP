import 'dart:isolate';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/services/http_api_service.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final HttpApiService httpApiService;

  FilmsBloc({required this.httpApiService}) : super(const FilmsState()) {
    on<_FilmsFetchedEvent>(_onFilmsFetched);
  }

  Future<void> _onFilmsFetched(
      _FilmsFetchedEvent event, Emitter<FilmsState> emit) async {
    try {
      if (state.status == FilmsStatus.initial) {
        final films = _fetchFilms();
        return emit(state.copyWith(
          status: FilmsStatus.success,
          films: films,
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  _addFilmToFavorite() {}
  _removeFilmFromFavorite() {}

  _fetchFilms() {}
}
