import 'package:corelab_app_challenge/core/errors/failures.dart';
import 'package:corelab_app_challenge/core/usecase/usecase.dart';
import 'package:corelab_app_challenge/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SaveSearchUsecase implements UseCase<void, String> {
  final SearchRepository repository;

  SaveSearchUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String search) async {
    return repository.saveSearch(search);
  }
}
