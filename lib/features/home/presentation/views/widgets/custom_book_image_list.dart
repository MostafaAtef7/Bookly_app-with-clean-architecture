import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/home/presentation/manager/books_photos_cubit/books_photos_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBooksPhotosList extends StatelessWidget {
  const CustomBooksPhotosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksPhotosCubit, BooksPhotosState>(
      builder: (context, state) {
        if (state is BooksPhotosSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              itemCount: state.books.length,
              separatorBuilder: (ctx, index) => const SizedBox(
                width: 15,
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
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                  ),
                );
              },
            ),
          );
        } else if (state is BooksPhotosFailure) {
          return CustomError(errMsg: state.errMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
