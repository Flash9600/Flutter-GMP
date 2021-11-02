import 'package:flutter/material.dart';
import 'package:flutter_gmp/widgets/favorite_page/favorite_page.dart';
import 'package:flutter_gmp/widgets/films_page/films_page.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Films'),
              Tab(text: 'Favorite'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FilmsPageWidget(),
            FavoritePageWidget(),
          ],
        ),
      ),
    );
  }
}
