part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState() : super();

  @override
  List<Object?> get props => [];
}

class FilmsStateProgress extends FilmsState {
  const FilmsStateProgress() : super();
}

class FilmsStateFailed extends FilmsState {
  const FilmsStateFailed() : super();
}

class FilmsStateInit extends FilmsState {
  const FilmsStateInit() : super();
}

class FilmsStateSuccess extends FilmsState {
  final List<FilmViewModel> filmsList;
  final List<FilmViewModel> favoriteFilms;
  final List<FilmsListViewModel> filmsListView;
  final List<FilmsListViewModel> favoriteFilmsView;

  const FilmsStateSuccess({
    this.filmsList = const <FilmViewModel>[],
    this.favoriteFilms = const <FilmViewModel>[],
    this.filmsListView = const <FilmsListViewModel>[],
    this.favoriteFilmsView = const <FilmsListViewModel>[],
  }) : super();

  @override
  List<Object> get props =>
      [filmsList, favoriteFilms, filmsListView, favoriteFilmsView];

  FilmsState copyWith({
    List<FilmViewModel>? filmsList,
    List<FilmViewModel>? favoriteFilms,
    List<FilmsListViewModel>? filmsListView,
    List<FilmsListViewModel>? favoriteFilmsView,
  }) {
    return FilmsStateSuccess(
      filmsList: filmsList ?? this.filmsList,
      favoriteFilms: favoriteFilms ?? this.favoriteFilms,
      filmsListView: filmsListView ?? this.filmsListView,
      favoriteFilmsView: favoriteFilmsView ?? this.favoriteFilmsView,
    );
  }
}
