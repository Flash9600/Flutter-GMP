import 'package:flutter/material.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/common/images.dart';
import 'package:flutter_gmp/widgets/detail_page/detail_page.dart';
import 'package:flutter_gmp/widgets/films_list/buttons_wrapper.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FilmsListWidget extends StatelessWidget {
  final List<FilmsListViewModel> viewModelList;

  const FilmsListWidget({
    required this.viewModelList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      itemCount: viewModelList.length,
      itemBuilder: (context, dateIndex) {
        return StickyHeader(
          header: Container(
            height: 40.0,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              viewModelList[dateIndex].date.toString().substring(0, 7),
            ),
          ),
          content: ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: viewModelList[dateIndex].filmsList.length,
            itemBuilder: (context, filmIndex) {
              return _FilmsItemWidget(
                filmViewModel: viewModelList[dateIndex].filmsList[filmIndex],
              );
            },
            separatorBuilder: (_, __) => const Divider(color: Colors.black),
          ),
        );
      },
    );
  }
}

class _FilmsItemWidget extends StatelessWidget {
  final FilmViewModel filmViewModel;

  const _FilmsItemWidget({
    Key? key,
    required this.filmViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPageWidget(filmViewModel: filmViewModel),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Column(
              children: [
                FilmImage(
                  path: filmViewModel.posterPath,
                  height: 120,
                ),
                Text(filmViewModel.rating.toString()),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 160),
                child: Column(
                  children: [
                    Text(filmViewModel.title),
                    Expanded(
                      child: Text(filmViewModel.description,
                          overflow: TextOverflow.fade),
                    ),
                    ButtonsWrapperWidget(
                      addToFavoritesOnTap: () {},
                      shareOnTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
