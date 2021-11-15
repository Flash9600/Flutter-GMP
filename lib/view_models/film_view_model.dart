class FilmViewModel {
  final String title;
  final String description;
  final String rating;
  final String imageUrl;
  final DateTime reliseDate;

  const FilmViewModel({
    required this.title,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.reliseDate,
  });
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
}
