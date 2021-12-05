part of 'films_bloc.dart';

abstract class FilmsEvent {
  const FilmsEvent();

  const factory FilmsEvent.fetch() = FilmsFetchedEvent;
  const factory FilmsEvent.addToFavorite({required int id}) =
      AddFilmToFavoriteEvent;
  const factory FilmsEvent.removeFromFavorite({required int id}) =
      RemoveFilmFromFavoriteEvent;
}

class FilmsFetchedEvent extends FilmsEvent {
  const FilmsFetchedEvent();
}

class AddFilmToFavoriteEvent extends FilmsEvent {
  final int id;

  const AddFilmToFavoriteEvent({required this.id});
}

class RemoveFilmFromFavoriteEvent extends FilmsEvent {
  final int id;

  const RemoveFilmFromFavoriteEvent({required this.id});
}
