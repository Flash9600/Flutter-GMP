part of 'films_bloc.dart';

abstract class FilmsEvent {
  const FilmsEvent();

  const factory FilmsEvent.fetch({String language}) = FilmsFetchedEvent;
  const factory FilmsEvent.addToFavorite({required int id}) =
      AddFilmToFavoriteEvent;
  const factory FilmsEvent.removeFromFavorite({required int id}) =
      RemoveFilmFromFavoriteEvent;
  const factory FilmsEvent.switchLanguage({required String language}) =
      SwitchLanguageEvent;
}

class FilmsFetchedEvent extends FilmsEvent {
  final String language;

  const FilmsFetchedEvent({this.language = LanguageType.en});
}

class AddFilmToFavoriteEvent extends FilmsEvent {
  final int id;

  const AddFilmToFavoriteEvent({required this.id});
}

class RemoveFilmFromFavoriteEvent extends FilmsEvent {
  final int id;

  const RemoveFilmFromFavoriteEvent({required this.id});
}

class SwitchLanguageEvent extends FilmsEvent {
  final String language;

  const SwitchLanguageEvent({required this.language});
}
