import 'package:corelab_app_challenge/features/home/data/datasources/home_datasource.dart';
import 'package:corelab_app_challenge/features/home/data/datasources/mock/home_mock_datasource.dart';
import 'package:corelab_app_challenge/features/home/data/repositories/home_repository_impl.dart';
import 'package:corelab_app_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:corelab_app_challenge/features/home/domain/usecases/fetch_products_usecase.dart';
import 'package:corelab_app_challenge/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // bloc
  sl.registerFactory(() => HomeBloc(sl()));

  // use cases
  sl.registerLazySingleton(() => FetchProductsUsecase(sl()));

  // repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // data sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeMockDataSourceImpl());
}
