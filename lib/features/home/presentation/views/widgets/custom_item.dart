import 'package:bookly/core/utils/text_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          CustomBookImage(imageUrl: book.volumeInfo!.imageLinks!.thumbnail!),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    book.volumeInfo!.title ?? " ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // copyWith => rewrite the values
                    style: Styles.textStyle20.copyWith(fontFamily: "GT"),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  child: Text(
                    book.volumeInfo!.authors!.first,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        "Free",
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Bookrating(
                      mainAxisAlignment: MainAxisAlignment.center,
                      rating: book.volumeInfo!.averageRating ?? 0,
                      count: book.volumeInfo!.ratingsCount ?? 0,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
