// Repositry Pattern => create abstract class with method without implementation
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // Either => abstract class from dartz package that has left side if there is exception and right side if there isn't
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failures, List<BookEntity>>> fetchRelevantBooks(
      {required String category});
}
