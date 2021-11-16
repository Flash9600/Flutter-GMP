import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_gmp/entity/playing_films.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';

part 'http_api_service.chopper.dart';

const _kApiKey = '5f3db21eab1266ec44623577da01412d';

@ChopperApi(baseUrl: '/3/movie')
abstract class HttpApiService extends ChopperService {
  static HttpApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org',
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
        final films = playingFilmsResponse.results;
        films.sort((filmFirst, filmSecond) =>
            filmFirst.releaseDate.compareTo(filmSecond.releaseDate));

        for (var viewModel in films) {
          if (films.indexOf(viewModel) > 0 &&
              viewModel.releaseDate.month == listViewModel.last.date.month) {
            listViewModel.last.addFilmsToList(viewModel);
            continue;
          }
          listViewModel.add(FilmsListViewModel(
              date: viewModel.releaseDate, filmsList: [viewModel]));
        }

        for (var viewModel in listViewModel) {
          viewModel.filmsList.sort((filmFirst, filmSecond) =>
              filmFirst.rating.compareTo(filmSecond.rating));
        }
      }
    } catch (e) {
      print(e);
    }
    return listViewModel;
  }
}
