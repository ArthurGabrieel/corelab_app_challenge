import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecentsSearchsUseCase implements UseCase<List<String>, NoParams> {
  final SearchRepository repository;

  GetRecentsSearchsUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.getRecentsSearchs();
  }
}
