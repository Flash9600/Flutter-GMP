import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmp/services/http_api_service.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/films_list/films_list.dart';

class FilmsPageWidget extends StatelessWidget {
  const FilmsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiService = HttpApiService.create();

    return FutureBuilder<List<FilmsListViewModel>>(
        future: apiService.getActualFilmsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return FilmsListWidget(viewModelList: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
