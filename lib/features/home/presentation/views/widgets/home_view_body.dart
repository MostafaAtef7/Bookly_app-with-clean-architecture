import 'package:bookly/core/utils/text_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_item_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        // SliverToBoxAdapter => must make shrinkWrap: true in ListView
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: CustomAppBar(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomBooksPhotosList(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Best Seller",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
        // SliverFillRemaining => make ListView built the remaining space in the screen not all items at once
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: CustomItemList(),
          ),
        )
      ],
    );
  }
}
