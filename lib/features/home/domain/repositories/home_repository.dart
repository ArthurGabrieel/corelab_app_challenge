import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Product>>> fetchTodayProducts();
  Future<Either<Failure, List<Product>>> fetchYesterdayProducts();
}
