import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource <Param>{
  // Data Source => get data only. it don't handle errors because it's already handled in repo

  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchRelevantBooks({required Param category});
}
class HomeRemoteDataSourceImp extends HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchRelevantBooks({required category}) {
    // TODO: implement fetchRelevantBooks
    throw UnimplementedError();
  }

}
