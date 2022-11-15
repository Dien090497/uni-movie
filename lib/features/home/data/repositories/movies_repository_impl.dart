import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/exception.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/common/network/network_info.dart';
import 'package:movie_app/features/home/data/datasource/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({required this.localDataSource, required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    if(await networkInfo.isConnected){
      try{
        final remotePost = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePost);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> getDetailMovies(String id) async {
    if(await networkInfo.isConnected){
      try{
        final remotePost = await remoteDataSource.getDetail(id);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyCacheFailure());
    }
  }
  
}