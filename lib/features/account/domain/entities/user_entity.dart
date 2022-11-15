import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String address;
  final int age;
  final String phone;
  final String id;

  UserEntity(
      {required this.name,
      required this.address,
      required this.age,
      required this.phone,
      required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [name, address, age, phone, id];
}
