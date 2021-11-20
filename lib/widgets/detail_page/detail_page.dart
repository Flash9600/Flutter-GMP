import 'package:flutter/material.dart';
import 'package:flutter_gmp/services/http_api_service.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/common/images.dart';

class DetailPageWidget extends StatelessWidget {
  final FilmViewModel filmViewModel;

  const DetailPageWidget({
    Key? key,
    required this.filmViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(filmViewModel.title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (filmViewModel.posterPath != null)
                FilmImage(
                  path: filmViewModel.posterPath,
                  height: 300,
                ),
              const SizedBox(height: 30),
              Text(filmViewModel.title),
              const SizedBox(height: 20),
              Text(filmViewModel.description),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(filmViewModel.rating.toString()),
                  Text(filmViewModel.releaseDate.toString().substring(0, 10)),
                ],
              ),
            ],
          ),
        ));
  }
}
