import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "book_search_state.dart";

class BookSearchCubit extends Cubit<BookSearchState> {
  BookSearchCubit(this.searchRepo) : super(BookSearchInitial());
  final SearchRepo searchRepo;
  String searchWords = "";

  Future<void> fetchBooksInSearch(String search) async {
    searchWords = search;
    emit(BookSearchLoading());
    var result = await searchRepo.fetchSearchedBooks();
    result.fold((failure) => emit(BookSearchFailure(errMsg: failure.errMsg)),
        (books) => emit(BookSearchSuccess(books: books)));
  }
}
