import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];


}

class Login extends LoginEvent{
  final String id;
  Login({required this.id});

  @override
  List<Object> get props => [id];
}

