import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo_implementation.dart';
import 'package:bookly/features/search/data/repo/search_repo_implementation.dart';
import 'package:get_it/get_it.dart';

// GetIt => its a package that allow me use Object many times with out created call it alot this package same like shared preference
final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(ApiService()));
  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation());
}
