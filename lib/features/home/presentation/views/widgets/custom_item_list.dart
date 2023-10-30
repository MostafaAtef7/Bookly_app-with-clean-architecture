import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomItemList extends StatelessWidget {
  const CustomItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
              // to prevent Scrolling in this list
              physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap => to deal with Slivers but it make ListView build all items in one time this will affect on performance
              // shrinkWrap: true,
              itemCount: state.books.length,
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 15,
                  ),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                    onTap: () {
                      // if we add extra to to page we must give it the extra when we navigate
                      GoRouter.of(context).push(AppRouter.bookDetailsView, extra: state.books[index]);
                    },
                    child: CustomItem(book: state.books[index]));
              });
        } else if (state is NewestBooksFailure) {
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
