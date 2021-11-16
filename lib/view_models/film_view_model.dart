import 'package:json_annotation/json_annotation.dart';

part 'film_view_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilmViewModel {
  final String? posterPath;
  @JsonKey(name: 'overview')
  final String description;
  final DateTime releaseDate;
  final int id;
  final String title;
  final String? backdropPath;
  @JsonKey(name: 'vote_average')
  final double rating;

  FilmViewModel({
    required this.id,
    required this.posterPath,
    required this.description,
    required this.rating,
    required this.releaseDate,
    required this.backdropPath,
    required this.title,
  });

  factory FilmViewModel.fromJson(Map<String, dynamic> json) =>
      _$FilmViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilmViewModelToJson(this);
}

class FilmsListViewModel {
  final DateTime date;
  final List<FilmViewModel> filmsList;

  const FilmsListViewModel({
    required this.date,
    required this.filmsList,
  });

  void addFilmsToList(FilmViewModel film) {
    filmsList.add(film);
  }

  static List<FilmsListViewModel> sortFilmsListToViewModel(
      List<FilmViewModel> films) {
    List<FilmsListViewModel> listViewModel = [];

    for (var viewModel in films) {
      if (films.indexOf(viewModel) > 0 &&
          viewModel.releaseDate.month == listViewModel.last.date.month) {
        listViewModel.last.addFilmsToList(viewModel);
        continue;
      }
      listViewModel.add(FilmsListViewModel(
          date: viewModel.releaseDate, filmsList: [viewModel]));
    }

    for (var viewModel in listViewModel) {
      viewModel.filmsList.sort((filmFirst, filmSecond) =>
          filmFirst.rating.compareTo(filmSecond.rating));
    }
    return listViewModel;
  }
}
