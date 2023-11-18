import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repo/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manager/books_photos_cubit/books_photos_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly/features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          // getIt.get<HomeRepoImplementation>() => to get singleton that i made
          BlocProvider(
            create: (ctx) => BooksPhotosCubit(
              getIt.get<HomeRepoImplementation>(),
            )..fetchBooksPhotos(), //two dots to call this function after running the cubit
          ),
          BlocProvider(
            create: (ctx) => NewestBooksCubit(
              getIt.get<HomeRepoImplementation>(),
            )..fetchNewestBooks(),
          ),
          BlocProvider(
            create: (ctx) => BookSearchCubit(
              getIt.get<SearchRepoImplementation>(),
            ),
          ),
        ],
        /*GetMaterialApp => used when i use Getx*/
        // MaterialApp.router => used with go_router package that manage all navigation of the app
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: kPrimaryColor,
            brightness: Brightness.dark,
            // to apply the font to all app use font with TextTheme
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          ),
        ),
      ),
    );
  }
}
