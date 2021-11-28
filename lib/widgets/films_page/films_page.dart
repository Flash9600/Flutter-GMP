import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/bloc/films_bloc/films_bloc.dart';
import 'package:flutter_gmp/generated/l10n.dart';
import 'package:flutter_gmp/widgets/common/error.dart';
import 'package:flutter_gmp/widgets/films_list/films_list.dart';

class FilmsPageWidget extends StatelessWidget {
  const FilmsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsBloc, FilmsState>(builder: (context, state) {
      if (state is FilmsStateSuccess) {
        return FilmsListWidget(viewModelList: state.filmsListView);
      } else if (state is FilmsStateProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FilmsStateFailed) {
        return ErrorPageWidget(S.of(context).error);
      } else {
        return ErrorPageWidget(S.of(context).somethingWentWrong);
      }
    });
  }
}
