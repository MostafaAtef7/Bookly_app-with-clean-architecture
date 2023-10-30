import 'package:bookly/core/utils/text_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_book_list.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverFillRemaining => work with expanded but SingleChildScrollView can not work
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppbar(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? "",
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  bookModel.volumeInfo!.title ?? "",
                  style: Styles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    bookModel.volumeInfo!.authors!.first,
                    style: Styles.textStyle16
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Bookrating(
                  rating: bookModel.volumeInfo!.averageRating ?? 0,
                  count: bookModel.volumeInfo!.ratingsCount ?? 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                BookAction(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also Like.",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksList(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
