import 'package:equatable/equatable.dart';
import 'package:movie_app/features/account/domain/entities/user_entity.dart';

abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class IsLogin extends LoginState{
  final UserEntity user;

  IsLogin({required this.user});

  @override
  List<Object> get props => [user];
}

class IsLogOut extends LoginState{}

class ErrorLoginState extends LoginState{
  final String message;

  ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
