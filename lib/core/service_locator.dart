import 'package:corelab_app_challenge/features/home/data/datasources/home_datasource.dart';
import 'package:corelab_app_challenge/features/home/data/datasources/mock/home_mock_datasource.dart';
import 'package:corelab_app_challenge/features/home/data/repositories/home_repository_impl.dart';
import 'package:corelab_app_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_today_products_usecase.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_yesterday_products_usecase.dart';
import 'package:corelab_app_challenge/features/home/presentation/bloc/home_bloc.dart';
import 'package:corelab_app_challenge/features/search/data/datasources/mock/search_mock_datasource.dart';
import 'package:corelab_app_challenge/features/search/data/datasources/search_datasource.dart';
import 'package:corelab_app_challenge/features/search/data/repositories/search_repository_impl.dart';
import 'package:corelab_app_challenge/features/search/domain/repositories/search_repository.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/get_recents_searchs_usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/search_usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/usecases/save_search_usecase.dart';
import 'package:corelab_app_challenge/features/search/presentation/bloc/search_bloc.dart';
import 'package:corelab_app_challenge/shared/external/mock/products_mock.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // bloc
  sl.registerFactory(() => HomeBloc(
        fetchTodayProducts: sl(),
        fetchYesterdayProducts: sl(),
      ));

  sl.registerFactory(() => SearchBloc(
        getRecentsSearchs: sl(),
        search: sl(),
        saveSearch: sl(),
      ));

  // use cases
  sl.registerLazySingleton(() => FetchTodayProducts(sl()));
  sl.registerLazySingleton(() => FetchYesterdayProducts(sl()));

  sl.registerLazySingleton(() => GetRecentsSearchsUseCase(sl()));
  sl.registerLazySingleton(() => SearchUseCase(sl()));
  sl.registerLazySingleton(() => SaveSearchUsecase(sl()));

  // repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));

  // data sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeMockDataSourceImpl(sl()));
  sl.registerLazySingleton<SearchDataSource>(() => SearchMockDataSource(sl()));

  // external
  sl.registerLazySingleton(() => ProductsMock());
}
