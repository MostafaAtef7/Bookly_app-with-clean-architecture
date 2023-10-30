part of 'relevant_books_cubit.dart';

sealed class RelevantBooksState extends Equatable {
  const RelevantBooksState();

  @override
  List<Object> get props => [];
}

final class RelevantBooksInitial extends RelevantBooksState {}

final class RelevantBooksLoading extends RelevantBooksState {}

final class RelevantBooksFailure extends RelevantBooksState {
  final String errMsg;

  const RelevantBooksFailure({required this.errMsg});
}

final class RelevantBooksSuccess extends RelevantBooksState {
  final List<BookModel> books;

  const RelevantBooksSuccess({required this.books});
}
