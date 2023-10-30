import 'package:bookly/core/utils/text_styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
