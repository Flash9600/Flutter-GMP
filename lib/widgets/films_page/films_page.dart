import 'package:flutter/material.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/films_list/films_list.dart';

class FilmsPageWidget extends StatelessWidget {
  final List<FilmsListViewModel> viewModelList;

  const FilmsPageWidget({
    Key? key,
    required this.viewModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilmsListWidget(
      viewModelList: viewModelList,
    );
  }
}
