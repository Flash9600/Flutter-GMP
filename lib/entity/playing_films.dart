import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playing_films.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PlayingFilmsResponse {
  final int page;
  final List<FilmViewModel> results;
  final int totalPages;
  final int totalResults;

  PlayingFilmsResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PlayingFilmsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayingFilmsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayingFilmsResponseToJson(this);
}
