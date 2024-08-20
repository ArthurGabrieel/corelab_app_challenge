import 'package:bloc/bloc.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_products_usecase.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(FetchProductsUsecase fetchProductsUsecase) : super(HomeInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(HomeLoading());

      final result = await fetchProductsUsecase(NoParams());

      result.fold(
        (failure) => emit(HomeError(failure.message)),
        (products) => emit(HomeLoaded(products)),
      );
    });

    on<RefreshProducts>((event, emit) {
      emit(HomeInitial());
      add(FetchProducts());
    });
  }
}
