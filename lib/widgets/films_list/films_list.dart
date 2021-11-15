import 'package:flutter/material.dart';
import 'package:flutter_gmp/view_models/film_view_model.dart';
import 'package:flutter_gmp/widgets/common/buttons.dart';
import 'package:flutter_gmp/widgets/detail_page/detail_page.dart';
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
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Image.network('https://image.tmdb.org/t/p/w500' +
                      (filmViewModel.imageUrl ?? '')),
                ),
                Text(filmViewModel.rating.toString()),
              ],
            ),
            Column(
              children: [
                Text(filmViewModel.title),
                Text(filmViewModel.description),
                const Divider(),
                Row(
                  children: [
                    TileTextButton.addToFavorites(onTap: () {}),
                    TileTextButton.share(onTap: () {}),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
