import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home.repo.dart';
import 'package:equatable/equatable.dart';

part 'books_photos_state.dart';

class BooksPhotosCubit extends Cubit<BooksPhotosState> {
  BooksPhotosCubit(this.homeRepo) : super(BooksPhotosInitial());

  final HomeRepo homeRepo;
  Future<void> fetchBooksPhotos() async {
    try {
  emit(BooksPhotosLoading());
  var result = await homeRepo.fetchNewestBooks();
  result.fold((failure) => emit(BooksPhotosFailure(errMsg: failure.errMsg)),
      (books) => emit(BooksPhotosSuccess(books: books)));
} on Exception {
  emit(const BooksPhotosFailure(errMsg: "Requisted disabled"));
}
  }
}
