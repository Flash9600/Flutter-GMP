import 'package:json_annotation/json_annotation.dart';

part 'film_view_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilmViewModel {
  @JsonKey(name: 'poster_path')
  final String? imageUrl;
  final bool adult;
  @JsonKey(name: 'overview')
  final String description;
  final DateTime releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final num popularity;
  final int voteCount;
  final bool video;
  @JsonKey(name: 'vote_average')
  final int rating;

  FilmViewModel({
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.releaseDate,
    required this.genreIds,
    required this.originalTitle,
    required this.originalLanguage,
    required this.backdropPath,
    required this.voteCount,
    required this.adult,
    required this.id,
    required this.title,
    required this.popularity,
    required this.video,
  });

  factory FilmViewModel.fromJson(Map<String, dynamic> json) =>
      _$FilmViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilmViewModelToJson(this);
}

class FilmsListViewModel {
  final DateTime date;
  final List<FilmViewModel> filmsList;
  const FilmsListViewModel({
    required this.date,
    required this.filmsList,
  });

  void addFilmsToList(FilmViewModel film) {
    filmsList.add(film);
  }
}
