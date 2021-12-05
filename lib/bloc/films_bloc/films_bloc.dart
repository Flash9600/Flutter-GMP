import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmp/generated/l10n.dart';
import 'package:flutter_gmp/services/http_api_service.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final HttpApiService httpApiService;
  final BuildContext context;

  FilmsBloc({required this.httpApiService, required this.context})
      : super(const FilmsStateInit()) {
    on<FilmsFetchedEvent>(_fetchFilms);
    on<AddFilmToFavoriteEvent>(_addFilmToFavorite);
    on<RemoveFilmFromFavoriteEvent>(_removeFilmFromFavorite);
    add(const FilmsFetchedEvent());
  }

  Future<void> _fetchFilms(
      FilmsFetchedEvent event, Emitter<FilmsState> emit) async {
    emit(const FilmsStateProgress());
    try {
      final films =
          await httpApiService.getActualFilmsList(S.of(context).language);

      return emit(
        FilmsStateSuccess(
          filmsList: films,
          filmsListView: _mapFilmsListToViewModel(films),
        ),
      );
    } catch (e) {
      print(e);

      return emit(const FilmsStateFailed());
    }
  }

  Future<void> _addFilmToFavorite(
      AddFilmToFavoriteEvent event, Emitter<FilmsState> emit) async {
    if (state is FilmsStateSuccess) {
      final succesState = state as FilmsStateSuccess;
      final favoriteFilms = [...succesState.favoriteFilms];

      final filmInFavoriteAvailabiliy = succesState.favoriteFilms
          .where((film) => film.id == event.id)
          .isNotEmpty;

      if (filmInFavoriteAvailabiliy) {
        return;
      }

      final film =
          succesState.filmsList.firstWhere((film) => film.id == event.id);
      film.isFavorite = true;
      favoriteFilms.add(film);

      return emit(
        succesState.copyWith(
          favoriteFilms: favoriteFilms,
          favoriteFilmsView: _mapFilmsListToViewModel(favoriteFilms),
        ),
      );
    }
  }

  Future<void> _removeFilmFromFavorite(
      RemoveFilmFromFavoriteEvent event, Emitter<FilmsState> emit) async {
    if (state is FilmsStateSuccess) {
      final succesState = state as FilmsStateSuccess;
      final favoriteFilms = [...succesState.favoriteFilms];
      favoriteFilms.removeWhere((film) => film.id == event.id);

      return emit(
        succesState.copyWith(
          favoriteFilms: favoriteFilms,
          favoriteFilmsView: _mapFilmsListToViewModel(favoriteFilms),
        ),
      );
    }
  }

  List<FilmsListViewModel> _mapFilmsListToViewModel(List<FilmViewModel> films) {
    List<FilmsListViewModel> listViewModel = [];

    for (var viewModel in films) {
      if (films.indexOf(viewModel) > 0 &&
          viewModel.releaseDate.month == listViewModel.last.date.month) {
        listViewModel.last.addFilmsToList(viewModel);
        continue;
      }

      listViewModel.add(FilmsListViewModel(
          date: viewModel.releaseDate, filmsList: [viewModel]));
    }

    for (var viewModel in listViewModel) {
      viewModel.filmsList.sort((filmFirst, filmSecond) =>
          filmFirst.rating.compareTo(filmSecond.rating));
    }

    return listViewModel;
  }

  @override
  onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
