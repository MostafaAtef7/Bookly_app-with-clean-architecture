import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCaseMethods<List<BookEntity>>{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  // use case could be used or not. In this app we implement it only but we won't use it.
  
  @override
  Future<Either<Failures, List<BookEntity>>> call() async{
    // here we could check premission for example
    return await homeRepo.fetchNewestBooks();
  }
}

// this class responsible to handle team work it make all team override this method with the same name to all team
abstract class UseCaseMethods<Type> {
  Future<Either<Failures, Type>> call();
}
