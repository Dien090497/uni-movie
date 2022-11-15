
import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';

abstract class MovieRepository{
  Future<Either<Failure, List<MovieEntity>>> getAllMovies();
  Future<Either<Failure, MovieEntity>> getDetailMovies(String id);
}