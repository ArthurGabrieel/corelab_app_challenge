import 'package:bloc/bloc.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/get_recents_searchs_usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/save_search_usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/search_usecase.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required GetRecentsSearchsUseCase getRecentsSearchs,
    required SearchUseCase search,
    required SaveSearchUsecase saveSearch,
  }) : super(SearchInitial()) {
    on<GetRecentSearchs>((event, emit) async {
      emit(SearchLoading());

      final result = await getRecentsSearchs(NoParams());
      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (recents) => emit(RecentSearchsLoaded(recents)),
      );
    });

    on<SearchStarted>((event, emit) async {
      emit(SearchLoading());

      final result = await search(event.query);
      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (products) => emit(SearchLoaded(products)),
      );
    });

    on<SaveSearch>((event, emit) async {
      final result = await saveSearch(event.search);

      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (_) => emit(SearchSaved()),
      );
    });
  }
}
