import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/common/strings/failures.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';
import 'package:movie_app/features/home/domain/usecase/get_all_movie_usecase.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_event.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState>{
  final GetAllMoviesUseCase getAllMovies;
  MovieBloc({required this.getAllMovies}) : super(MovieInitial()){
    on<MovieEvent>((event, emit) async {
      if(event is GetAllMovieEvent){
        emit(LoadingMovieState());

        final movie = await getAllMovies();

        emit(_mapFailureOrMovieToState(movie));
      } else if (event is RefreshMovieEvent){
        emit(LoadingMovieState());

        final posts = await getAllMovies();
        emit(_mapFailureOrMovieToState(posts));
      }
    });
  }

  MovieState _mapFailureOrMovieToState(Either<Failure, List<MovieEntity>> either){
    return either.fold(
          (failure) => ErrorMovieState(message: _mapFailureToMessage(failure)),
          (movie) => LoadedMovieState(movies: movie),
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }
}