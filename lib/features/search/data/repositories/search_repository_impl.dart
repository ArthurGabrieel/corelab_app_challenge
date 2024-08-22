import 'package:corelab_app_challenge/core/errors/exceptions.dart';
import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/features/search/data/datasources/search_datasource.dart';
import 'package:corelab_app_challenge/features/search/domain/repositories/search_repository.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<String>>> getRecentsSearchs() async {
    try {
      final result = await dataSource.getRecentsSearchs();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Error fetching recents searchs'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> search(String query) async {
    try {
      final result = await dataSource.search(query);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Error fetching search'));
    }
  }

  @override
  Future<Either<Failure, bool>> saveSearch(String search) async {
    try {
      await dataSource.saveSearch(search);
      return const Right(true);
    } on ServerException {
      return const Left(ServerFailure('Error storing search'));
    }
  }
}
