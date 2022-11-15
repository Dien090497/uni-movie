import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:movie_app/common/error/failures.dart';
import 'package:movie_app/common/shared_preferences/key_shared_preferences.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSource{
  Future<List<MovieModel>> getCachedPosts();
  Future<Unit> cachePosts(List<MovieModel> postModels);
}

class MovieLocalDataSourceIplm implements MovieLocalDataSource{
  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceIplm({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<MovieModel> postModels) {
    List postModelsJson = postModels.map<Map<String, dynamic>>((postModel) => postModel.toJson()).toList();
    sharedPreferences.setString(K.MOVIES, json.encode(postModelsJson));
    return Future.value(unit);
  }

  @override
  Future<List<MovieModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(K.MOVIES);
    if(jsonString!.isNotEmpty){
      List decodeJsonData = json.decode(jsonString);
      List<MovieModel> models = decodeJsonData.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      return Future.value(models);
    }else{
      throw EmptyCacheFailure();
    }
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }

}