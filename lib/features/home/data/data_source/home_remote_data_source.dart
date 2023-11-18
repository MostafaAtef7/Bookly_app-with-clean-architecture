import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource<Param> {
  // Data Source => get data only. it don't handle errors because it's already handled in repo

  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchRelevantBooks({required Param category});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        url:
            "volumes?q=subjetc:Proframming&Filtering=free-ebooks&Sorting=relevance");
    List<BookEntity> bookEntity = getBooksMethod(data);
    return bookEntity;
  }

  List<BookEntity> getBooksMethod(Map<String, dynamic> data) {
    List<BookEntity> bookEntity = []; 
    for (var item in data["items"]) {
      bookEntity.add(BookModel.fromJson(item));
    }
    return bookEntity;
  }

  @override
  Future<List<BookEntity>> fetchRelevantBooks({required category}) {
    // TODO: implement fetchRelevantBooks
    throw UnimplementedError();
  }
}
