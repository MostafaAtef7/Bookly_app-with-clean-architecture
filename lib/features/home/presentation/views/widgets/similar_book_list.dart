import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/home/presentation/manager/relevant_books_cubit/relevant_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksList extends StatelessWidget {
  const SimilarBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelevantBooksCubit, RelevantBooksState>(
      builder: (context, state) {
        if (state is RelevantBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.separated(
              itemCount: state.books.length,
              separatorBuilder: (ctx, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.bookDetailsView,
                        extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail ??
                            " ",
                  ),
                );
              },
            ),
          );
        } else if (state is RelevantBooksFailure) {
          return CustomError(errMsg: state.errMsg);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
