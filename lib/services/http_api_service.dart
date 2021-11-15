import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmp/entity/playing_films.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/main_page/main_page.dart';

part 'http_api_service.chopper.dart';

const _kApiKey = '?api_key=5f3db21eab1266ec44623577da01412d';

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
    path: '/now_playing' + _kApiKey,
  )
  Future<Response> _getActualFilmsResponse();

  @Get(
    path: '/{id}' + _kApiKey,
  )
  Future<Response> _getFilmResponse(@Path('id') int id);

  Future<List<FilmsListViewModel>> getActualFilmsList() async {
    final response = await _getActualFilmsResponse();
    if (response.statusCode == 200) {
      final body = json.decode(response.bodyString) as Map<String, dynamic>;
      final playingFilmsResponse = PlayingFilmsResponse.fromJson(body);
      final films = playingFilmsResponse.results;
      List<FilmsListViewModel> listViewModel = [];
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
      return listViewModel;
    } else {
      throw Exception();
    }
  }
}
