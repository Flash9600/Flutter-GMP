// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_films.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayingFilmsResponse _$PlayingFilmsResponseFromJson(
        Map<String, dynamic> json) =>
    PlayingFilmsResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => FilmViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: (json['dates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DateTime.parse(e as String)),
      ),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$PlayingFilmsResponseToJson(
        PlayingFilmsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'dates': instance.dates.map((k, e) => MapEntry(k, e.toIso8601String())),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
