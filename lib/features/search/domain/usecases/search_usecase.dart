import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/repositories/search_repository.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase implements UseCase<List<Product>, String> {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(String params) async {
    return repository.search(params);
  }
}
