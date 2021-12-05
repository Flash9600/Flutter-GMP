import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/bloc/films_bloc/films_bloc.dart';
import 'package:flutter_gmp/widgets/common/error.dart';
import 'package:flutter_gmp/widgets/films_list/films_list.dart';

class FavoritePageWidget extends StatelessWidget {
  const FavoritePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsBloc, FilmsState>(
      builder: (context, state) {
        if (state is FilmsStateSuccess) {
          return FilmsListWidget(viewModelList: state.favoriteFilmsView);
        } else if (state is FilmsStateProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilmsStateFailed) {
          return const ErrorPageWidget('Error');
        } else {
          return const ErrorPageWidget('Somthing went wrong');
        }
      },
    );
  }
}
