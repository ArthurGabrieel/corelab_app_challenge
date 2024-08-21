import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

class FetchTodayProducts implements UseCase<List<Product>, NoParams> {
  final HomeRepository repository;

  FetchTodayProducts(this.repository);
  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return repository.fetchTodayProducts();
  }
}
