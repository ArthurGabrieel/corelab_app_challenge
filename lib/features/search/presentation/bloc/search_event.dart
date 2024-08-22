part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class GetRecentSearchs extends SearchEvent {}

final class SearchStarted extends SearchEvent {
  final String query;

  const SearchStarted(this.query);

  @override
  List<Object> get props => [query];
}

final class SaveSearch extends SearchEvent {
  final String search;

  const SaveSearch(this.search);

  @override
  List<Object> get props => [search];
}
