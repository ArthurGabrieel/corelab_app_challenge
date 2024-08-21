import 'package:bloc/bloc.dart';
import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_today_products_usecase.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_yesterday_products_usecase.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchTodayProducts fetchTodayProducts;
  final FetchYesterdayProducts fetchYesterdayProducts;

  HomeBloc({
    required this.fetchTodayProducts,
    required this.fetchYesterdayProducts,
  }) : super(HomeInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<RefreshProducts>(_onRefreshProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final resultToday = await fetchTodayProducts(NoParams());
    final resultYesterday = await fetchYesterdayProducts(NoParams());

    final state = await _handleFetchResults(resultToday, resultYesterday);

    emit(state);
  }

  Future<HomeState> _handleFetchResults(
    Either<Failure, List<Product>> resultToday,
    Either<Failure, List<Product>> resultYesterday,
  ) async {
    return resultToday.fold(
      (failure) => HomeError(failure.message),
      (productsToday) {
        return resultYesterday.fold(
          (failure) => HomeError(failure.message),
          (productsYesterday) => HomeLoaded(
            productsCreatedToday: productsToday,
            productsCreatedYesterday: productsYesterday,
          ),
        );
      },
    );
  }

  void _onRefreshProducts(RefreshProducts event, Emitter<HomeState> emit) {
    emit(HomeInitial());
    add(FetchProducts());
  }
}
