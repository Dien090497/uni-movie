import 'package:movie_app/features/home/data/models/model_cast.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';

class MovieModel extends MovieEntity{
  MovieModel({
    required String id,
    required String avatar,
    required String name,
    required String des,
    required double rate,
    required String synopsis,
    required List<CastModel> castAndCrews,
    required List<String> photos,
    required List<String> videos,
  }) : super(
            id: id,
            avatar: avatar,
            name: name,
            des: des,
            rate: rate,
            synopsis: synopsis,
            castAndCrew: castAndCrews,
            photos: photos,
            videos: videos);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      avatar: json['avatar'],
      name: json['name'],
      des: json['des'],
      rate: double.parse(json['rate'].toString()),
      synopsis: json['synopsis'],
      castAndCrews: List<dynamic>.from(json['castAndCrew']).map((e) => CastModel.fromJson(e)).toList(),
      photos: (json['photos'] as List).map((e) => e.toString()).toList(),
      videos: (json['videos'] as List).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'name': name,
      'des': des,
      'rate': rate,
      'synopsis': synopsis,
      'castAndCrew': castAndCrew,
      'photos': photos,
      'videos': videos,
    };
  }
}
