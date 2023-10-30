import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssetsPathes.logo,
          width: 100,
          height: 50,
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white,
          ),
          iconSize: 20,
          highlightColor: const Color.fromARGB(255, 83, 83, 83),
        ),
      ],
    );
  }
}
