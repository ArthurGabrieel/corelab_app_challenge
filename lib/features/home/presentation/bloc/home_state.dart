part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Product> productsCreatedToday;
  final List<Product> productsCreatedYesterday;

  const HomeLoaded({
    required this.productsCreatedToday,
    required this.productsCreatedYesterday,
  });

  @override
  List<Object> get props => [productsCreatedToday, productsCreatedYesterday];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
