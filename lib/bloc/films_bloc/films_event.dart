part of 'films_bloc.dart';

abstract class FilmsEvent {
  const FilmsEvent();

  const factory FilmsEvent.fetch() = _FilmsFetchedEvent;
  const factory FilmsEvent.addToFavorite({required int id}) =
      _AddFilmToFavoriteEvent;
  const factory FilmsEvent.removeFromFavorite({required int id}) =
      _RemoveFilmFromFavoriteEvent;
}

class _FilmsFetchedEvent extends FilmsEvent {
  const _FilmsFetchedEvent();
}

class _AddFilmToFavoriteEvent extends FilmsEvent {
  final int id;

  const _AddFilmToFavoriteEvent({required this.id});
}

class _RemoveFilmFromFavoriteEvent extends FilmsEvent {
  final int id;

  const _RemoveFilmFromFavoriteEvent({required this.id});
}
