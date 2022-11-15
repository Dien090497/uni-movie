import 'dart:convert';
import 'package:movie_app/common/error/exception.dart';
import 'package:movie_app/common/base_url/base_url.dart';
import 'package:movie_app/features/account/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource{
  Future<UserModel> login(String id);
}

class LoginDatasourceIplm implements LoginRemoteDataSource{
  final http.Client client;

  LoginDatasourceIplm({required this.client});

  @override
  Future<UserModel> login(String id) async {
    final response =
        await client.put(Uri.parse('${AppBaseUrl.BASE_URL}/login/$id'), headers: {
      "Content-Type": "application/json",
    });
    if(response.statusCode == 200) {
      final decodeJson = json.decode(response.body);
       final UserModel userModel = UserModel.fromJson(decodeJson);
        return userModel;
    } else {
      throw ServerException();
    }
  }

}
