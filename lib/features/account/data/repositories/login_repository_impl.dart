import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/exception.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/common/network/network_info.dart';
import 'package:movie_app/features/account/data/datasource/login_remote_data_source.dart';
import 'package:movie_app/features/account/domain/entities/user_entity.dart';
import 'package:movie_app/features/account/domain/repositories/login_reposiory.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> login(String id) async {
    if(await networkInfo.isConnected){
      try{
        final user = await remoteDataSource.login(id);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
