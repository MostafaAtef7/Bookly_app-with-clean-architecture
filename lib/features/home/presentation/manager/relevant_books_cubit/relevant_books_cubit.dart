import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home.repo.dart';
import 'package:equatable/equatable.dart';

part 'relevant_books_state.dart';

class RelevantBooksCubit extends Cubit<RelevantBooksState> {
  RelevantBooksCubit(this.homeRepo) : super(RelevantBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(RelevantBooksLoading());
    var result = await homeRepo.fetchRelevantBooks(category: category);
    result.fold(
      (failure) => emit(
        RelevantBooksFailure(errMsg: failure.errMsg),
      ),
      (books) => emit(
        RelevantBooksSuccess(books: books),
      ),
    );
  }
}
