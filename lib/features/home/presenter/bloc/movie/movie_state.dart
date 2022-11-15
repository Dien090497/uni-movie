import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState{}

class LoadingMovieState extends MovieState{}

class LoadedMovieState extends MovieState{
  final List<MovieEntity> movies;

  LoadedMovieState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorMovieState extends MovieState{
  final String message;

  ErrorMovieState({required this.message});

  @override
  List<Object> get props => [message];
}