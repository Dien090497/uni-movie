import 'package:movie_app/features/bottom_naviagation/bottom_navigation.dart';
import 'package:movie_app/features/home/presenter/page/view_all_detail_movie_page.dart';
import 'package:movie_app/features/home/presenter/page/detail_movie.dart';

class R {
  static const String _ = '/';
  static const String bottomNavigation = '${_}bottom_navigation';
  static const String HomePage = '${_}HomePage';
  static const String DetailMovie = '${_}DetailMovie';
  static const String CastAndCrewPage = '${_}CastAndCrewPage';
}

class AppRoutes {
  static final routes = {
    R.bottomNavigation: (_) => const BottomNavigationScreen(),
    R.DetailMovie: (_) => DetailMoviePage(),
    R.CastAndCrewPage: (_) => ViewAllDetailMoviePage(),
  };
}
