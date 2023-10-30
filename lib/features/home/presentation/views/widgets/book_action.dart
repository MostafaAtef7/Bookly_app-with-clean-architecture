import 'package:bookly/core/utils/functions/url_luncher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';


class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              urlLauncher(context, bookModel.volumeInfo!.previewLink ?? "");
            },
            text: r"Preview",
            textColor: Colors.white,
            backgroundColor: const Color(0xffef8262),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ),
      ],
    );
  }
}
