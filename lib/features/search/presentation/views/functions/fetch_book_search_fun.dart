import 'package:bookly/features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> fetchBookSearchFun(context, String value) async {
  await BlocProvider.of<BookSearchCubit>(context).fetchBooksInSearch(value);
}
