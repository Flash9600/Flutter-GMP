// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmViewModel _$FilmViewModelFromJson(Map<String, dynamic> json) =>
    FilmViewModel(
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      description: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      releaseDate: DateTime.parse(json['release_date'] as String),
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$FilmViewModelToJson(FilmViewModel instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'overview': instance.description,
      'release_date': instance.releaseDate.toIso8601String(),
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.rating,
    };
