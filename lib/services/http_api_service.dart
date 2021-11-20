import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_gmp/entity/playing_films.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';

part 'http_api_service.chopper.dart';

const _kApiKey = '5f3db21eab1266ec44623577da01412d';
const _kBaseUrl = 'https://api.themoviedb.org';
const _kImageUrl = 'https://image.tmdb.org/t/p/w500';

@ChopperApi(baseUrl: '/3/movie')
abstract class HttpApiService extends ChopperService {
  static HttpApiService create() {
    final client = ChopperClient(
      baseUrl: _kBaseUrl,
      services: [
        _$HttpApiService(),
      ],
      converter: const JsonConverter(),
    );

    return _$HttpApiService(client);
  }

  @Get(
    path: '/now_playing',
  )
  Future<Response> _getActualFilmsResponse(
      {@Query('api_key') String key = _kApiKey});

  @Get(
    path: '/{id}' + _kApiKey,
  )
  Future<Response> _getFilmResponse(@Path('id') int id);

  Future<List<FilmsListViewModel>> getActualFilmsList() async {
    List<FilmsListViewModel> listViewModel = [];
    try {
      final response = await _getActualFilmsResponse();

      if (response.isSuccessful) {
        final body = json.decode(response.bodyString) as Map<String, dynamic>;
        final playingFilmsResponse = PlayingFilmsResponse.fromJson(body);

        listViewModel = FilmsListViewModel.sortFilmsListToViewModel(
            playingFilmsResponse.results);
      }
    } catch (e) {
      print(e);
    }
    return listViewModel;
  }

  static String getImageUrl(String? posterPath) {
    return posterPath != null ? _kImageUrl + posterPath : '';
  }
}
