import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/common/network/network_info.dart';
import 'package:movie_app/features/account/data/datasource/login_remote_data_source.dart';
import 'package:movie_app/features/account/data/repositories/login_repository_impl.dart';
import 'package:movie_app/features/account/domain/repositories/login_reposiory.dart';
import 'package:movie_app/features/account/domain/usecase/login_usecase.dart';
import 'package:movie_app/features/account/presenter/bloc/login_bloc.dart';
import 'package:movie_app/features/home/data/datasource/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/repositories/movies_repository_impl.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/home/domain/usecase/get_all_movie_usecase.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async{
  //! Features - posts


  // BLOC
  // - Movie
  sl.registerFactory(() => MovieBloc(getAllMovies: sl()));
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  // - Movie detail


  // USECASE
  sl.registerLazySingleton(() => GetAllMoviesUseCase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));


  // REPOSITORY
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl()
  ));
  sl.registerLazySingleton<ILoginRepository>(() => LoginRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl()
  ));

  // DATASOURCE
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDatasourceIplm(client: sl()));
  sl.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceIplm(sharedPreferences: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginDatasourceIplm(client: sl()));

  // CORE
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}