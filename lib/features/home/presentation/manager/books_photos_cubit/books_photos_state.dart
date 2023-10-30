part of 'books_photos_cubit.dart';

sealed class BooksPhotosState extends Equatable {
  const BooksPhotosState();

  @override
  List<Object> get props => [];
}

final class BooksPhotosInitial extends BooksPhotosState {}

final class BooksPhotosLoading extends BooksPhotosState {}

final class BooksPhotosFailure extends BooksPhotosState {
  final String errMsg;

  const BooksPhotosFailure({required this.errMsg});
}

final class BooksPhotosSuccess extends BooksPhotosState {
  final List<BookModel> books;
  const BooksPhotosSuccess({required this.books});
}
