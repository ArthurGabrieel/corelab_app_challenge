import 'package:corelab_app_challenge/core/errors/exceptions.dart';
import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/features/home/data/datasources/home_datasource.dart';
import 'package:corelab_app_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Product>>> fetchTodayProducts() async {
    try {
      final productsCreatedToday = await dataSource.fetchTodayProducts();
      return Right(productsCreatedToday);
    } on ServerException {
      return const Left(ServerFailure('Error fetching products'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchYesterdayProducts() async {
    try {
      final productsCreatedYesterday =
          await dataSource.fetchYesterdayProducts();
      return Right(productsCreatedYesterday);
    } on ServerException {
      return const Left(ServerFailure('Error fetching products'));
    }
  }
}
