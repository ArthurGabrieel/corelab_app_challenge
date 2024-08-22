import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Product>>> search(String query);
  Future<Either<Failure, List<String>>> getRecentsSearchs();
  Future<Either<Failure, bool>> saveSearch(String search);
}
