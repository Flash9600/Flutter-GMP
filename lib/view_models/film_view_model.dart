import 'package:json_annotation/json_annotation.dart';

part 'film_view_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilmViewModel {
  @JsonKey(name: 'poster_path')
  final String? imageUrl;
  @JsonKey(name: 'overview')
  final String description;
  final DateTime releaseDate;
  final int id;
  final String title;
  final String? backdropPath;
  @JsonKey(name: 'vote_average')
  final double rating;

  FilmViewModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.releaseDate,
    required this.backdropPath,
    required this.title,
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
