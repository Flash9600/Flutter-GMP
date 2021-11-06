import 'package:flutter/material.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
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
        body: TabBarView(
          children: [
            FilmsPageWidget(viewModelList: CreateFilms().filmsList),
            FavoritePageWidget(viewModelList: CreateFilms().filmsList),
          ],
        ),
      ),
    );
  }
}

class CreateFilms {
  List<FilmsListViewModel> get filmsList => _filmsListViewModel();

  final _films = [
    FilmViewModel(
      title: 'Film1',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-07-20 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film2',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-08-20 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film3',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-09-20 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film4',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-07-10 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film5',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-08-10 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film6',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-09-10 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film7',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-07-05 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film8',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-08-05 20:18:04Z"),
    ),
    FilmViewModel(
      title: 'Film9',
      description: 'dewdewdwedewfer',
      rating: '5.1',
      imageUrl:
          'https://x-film.vip/uploads/posts/2021-09/1632721425-1830899868-finch.jpg',
      reliseDate: DateTime.parse("2020-09-05 20:18:04Z"),
    ),
  ];

  List<FilmsListViewModel> _filmsListViewModel() {
    List<FilmsListViewModel> listViewModel = [];
    _films.sort((filmFirst, filmSecond) =>
        filmFirst.reliseDate.compareTo(filmSecond.reliseDate));

    for (var viewModel in _films) {
      if (_films.indexOf(viewModel) > 0 &&
          viewModel.reliseDate.month == listViewModel.last.date.month) {
        listViewModel.last.addFilmsToList(viewModel);
        continue;
      }
      listViewModel.add(FilmsListViewModel(
          date: viewModel.reliseDate, filmsList: [viewModel]));
    }

    for (var viewModel in listViewModel) {
      viewModel.filmsList.sort((filmFirst, filmSecond) =>
          filmFirst.rating.compareTo(filmSecond.rating));
    }
    return listViewModel;
  }
}
