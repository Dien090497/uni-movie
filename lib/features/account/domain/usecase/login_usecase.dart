import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/features/account/domain/entities/user_entity.dart';
import 'package:movie_app/features/account/domain/repositories/login_reposiory.dart';

class LoginUsecase{
  final ILoginRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(String id) async {
    return await repository.login(id);
  }

}