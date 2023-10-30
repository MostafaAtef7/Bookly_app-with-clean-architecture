import 'package:bookly/features/search/presentation/views/functions/fetch_book_search_fun.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 131, 131, 131),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "Search",
          hintStyle: const TextStyle(fontSize: 15),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Color.fromARGB(255, 131, 131, 131),
              size: 20,
            ),
          ),
        ),
        onSubmitted: (value) {
          fetchBookSearchFun(context,value);
        },
      ),
    );
  }
}
