part of 'films_bloc.dart';

enum FilmsStatus { initial, success, failure }

class FilmsState extends Equatable {
  final List<FilmsListViewModel> films;
  final FilmsStatus status;

  const FilmsState({
    this.status = FilmsStatus.initial,
    this.films = const <FilmsListViewModel>[],
  });

  FilmsState copyWith({
    FilmsStatus? status,
    List<FilmsListViewModel>? films,
  }) {
    return FilmsState(
      status: status ?? this.status,
      films: films ?? this.films,
    );
  }

  @override
  String toString() {
    return 'FilmsState { status: $status, films: ${films.length} }';
  }

  @override
  List<Object> get props => [status, films];
}
