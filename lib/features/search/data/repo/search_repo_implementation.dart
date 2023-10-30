import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchedBooks() async {
    try {
      Map<String, dynamic> data = await ApiService().get(
          url:
              "volumes?q=subjetc:Proframming&Filtering=free-ebooks&Sorting=newest");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMsg: e.toString()));
    }
  }
}
