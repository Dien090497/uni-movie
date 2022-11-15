import 'package:movie_app/features/account/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String address,
    required int age,
    required String phone,
    required String id,
  }) : super(name: name, address: address, age: age, phone: phone, id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        address: json['address'],
        age: json['age'],
        phone: json['phone'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'age': age,
      'phone': phone,
      'id': id,
    };
  }
}
