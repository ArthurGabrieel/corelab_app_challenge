part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<Product> products;

  const SearchLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class RecentSearchsLoaded extends SearchState {
  final List<String> recentSearchs;

  const RecentSearchsLoaded(this.recentSearchs);

  @override
  List<Object> get props => [recentSearchs];
}

final class SearchSaved extends SearchState {}

final class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
