import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/manager/relevant_books_cubit/relevant_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly/features/search/presentation/manager/book_search_cubit/book_search_cubit.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = "/homeView";
  static const bookDetailsView = "/bookDetailsView";
  static const searchView = "/searchView";
  // All routers that app navigate with
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        /* routes with only "/" as path it initial route that the app navigate to */
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RelevantBooksCubit(getIt.get<HomeRepoImplementation>()),
          // state.extra => if i want to add extra objects
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) =>
            BlocProvider(
          create: (context) => BookSearchCubit(getIt.get<SearchRepoImplementation>()),
        child: const SearchView(),
        ),
      ),
    ],
  );
}
