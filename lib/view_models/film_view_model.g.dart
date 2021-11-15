// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmViewModel _$FilmViewModelFromJson(Map<String, dynamic> json) =>
    FilmViewModel(
      imageUrl: json['poster_path'] as String?,
      description: json['overview'] as String,
      rating: json['vote_average'] as int,
      releaseDate: DateTime.parse(json['release_date'] as String),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      backdropPath: json['backdrop_path'] as String?,
      voteCount: json['vote_count'] as int,
      adult: json['adult'] as bool,
      id: json['id'] as int,
      title: json['title'] as String,
      popularity: json['popularity'] as num,
      video: json['video'] as bool,
    );

Map<String, dynamic> _$FilmViewModelToJson(FilmViewModel instance) =>
    <String, dynamic>{
      'poster_path': instance.imageUrl,
      'adult': instance.adult,
      'overview': instance.description,
      'release_date': instance.releaseDate.toIso8601String(),
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.rating,
    };
