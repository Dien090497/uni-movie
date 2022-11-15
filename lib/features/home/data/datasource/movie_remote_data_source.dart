import 'dart:convert';
import 'package:movie_app/common/base_url/base_url.dart';
import 'package:movie_app/common/error/exception.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllPosts();

  Future<MovieModel> getDetail(String id);
}

class MovieRemoteDatasourceIplm implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDatasourceIplm({required this.client});

  @override
  Future<List<MovieModel>> getAllPosts() async {
    final response =
        await client.get(Uri.parse('${AppBaseUrl.BASE_URL}/movies/'), headers: {
      "Content-Type": "application/json",
    });
    if(response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MovieModel> movieModels = decodeJson
          .map<MovieModel>((e) {

            return MovieModel.fromJson(e);
          })
          .toList();
      return movieModels;
    } else {
      throw ServerException();
    }
  }
  @override
  Future<MovieModel> getDetail(String id) async {
    final response =
        await client.get(Uri.parse('${AppBaseUrl.BASE_URL}/posts/$id'), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body);
      final MovieModel movieModel = MovieModel.fromJson(decodeJson[0]);
      return movieModel;
    } else {
      throw ServerException();
    }
  }
}
