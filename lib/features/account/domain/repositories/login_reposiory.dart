import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/features/account/domain/entities/user_entity.dart';

abstract class ILoginRepository{
  Future<Either<Failure, UserEntity>> login(String id);
}