import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  // use case could be used or not in this app we implement it only but we won't use it
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() {
    // here we could check premission for example
    return homeRepo.fetchNewestBooks();
  }
}
