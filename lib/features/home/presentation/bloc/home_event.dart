part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchProducts extends HomeEvent {}

final class RefreshProducts extends HomeEvent {}
