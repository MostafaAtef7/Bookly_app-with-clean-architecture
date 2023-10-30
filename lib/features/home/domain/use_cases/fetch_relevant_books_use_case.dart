import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchRelevantBooksUseCase extends UseCaseMethods<List<BookEntity>,String> {
  final HomeRepo homeRepo;

  FetchRelevantBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call(String param) {
    return homeRepo.fetchRelevantBooks(category: param);
  }
}

abstract class UseCaseMethods<Type, Param> {
  Future<Either<Failures, Type>> call(Param param);
}
