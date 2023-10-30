import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/text_styles.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_item.dart';
import 'package:bookly/features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key});

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  String searchWords = "";
  List<BookModel> books = [];
  bool noResult = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookSearchCubit, BookSearchState>(
        listener: (context, state) {
      if (state is BookSearchSuccess) {
        setState(() {
          books.clear();
          books = state.books;
          searchWords = BlocProvider.of<BookSearchCubit>(context).searchWords;
        });
      }
    }, builder: (context, state) {
      if (state is BookSearchSuccess) {
        final List<BookModel> filteredBooks = books
            .where((book) => book.volumeInfo!.title!
                .toLowerCase()
                .contains(searchWords.toLowerCase()))
            .toList();

        if (filteredBooks.isEmpty) {
          return const Center(
            child: Text(
              "No Search Result",
              style: Styles.textStyle20,
            ),
          );
        } else {
          return ListView.separated(
            itemCount: filteredBooks.length,
            separatorBuilder: (ctx, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.bookDetailsView,
                      extra: filteredBooks[index]);
                },
                child: CustomItem(
                  book: filteredBooks[index],
                ),
              );
            },
          );
        }
      } else if (state is BookSearchFailure) {
        return CustomError(errMsg: state.errMsg);
      } else if (state is BookSearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text(
            "No Search Result",
            style: Styles.textStyle20,
          ),
        );
      }
    });
  }
}
