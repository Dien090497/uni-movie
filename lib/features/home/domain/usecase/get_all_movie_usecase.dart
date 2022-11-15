import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class GetAllMoviesUseCase{
  final MovieRepository repository;

  GetAllMoviesUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repository.getAllMovies();
  }
}