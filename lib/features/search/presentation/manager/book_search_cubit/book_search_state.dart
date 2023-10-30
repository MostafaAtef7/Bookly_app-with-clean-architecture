part of "book_search_cubit.dart";
@immutable
sealed class BookSearchState {}
final class BookSearchInitial extends BookSearchState {}
final class BookSearchLoading extends BookSearchState {}
final class BookSearchFailure extends BookSearchState {
  final String errMsg;
  BookSearchFailure({required this.errMsg});
}
final class BookSearchSuccess extends BookSearchState{
  final List<BookModel> books;
  BookSearchSuccess({required this.books});
}