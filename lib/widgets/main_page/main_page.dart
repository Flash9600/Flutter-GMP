import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/bloc/films_bloc/films_bloc.dart';
import 'package:flutter_gmp/generated/l10n.dart';
import 'package:flutter_gmp/main.dart';
import 'package:flutter_gmp/services/http_api_service.dart';
import 'package:flutter_gmp/widgets/favorite_page/favorite_page.dart';
import 'package:flutter_gmp/widgets/films_page/films_page.dart';
import 'package:flutter_gmp/widgets/main_page/drawer.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _TabsWidget();
  }
}

class _TabsWidget extends StatelessWidget {
  const _TabsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmsBloc(
        httpApiService: HttpApiService.create(),
        context: context,
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: [
                Tab(text: S.of(context).filmsLabel),
                Tab(text: S.of(context).favoriteLabel),
              ],
            ),
          ),
          drawer: const DrawerWidget(),
          body: const TabBarView(
            children: [
              FilmsPageWidget(),
              FavoritePageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
