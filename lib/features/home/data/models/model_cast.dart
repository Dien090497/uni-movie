import 'package:movie_app/features/home/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  CastModel({
    required String cast,
    required String avatar,
    required String nameFilm,
  }) : super(cast: cast, avatar: avatar, nameFilm: nameFilm);

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
        cast: json['cast'],
        avatar: json['avatar'],
        nameFilm: json['nameFilm']);
  }

  Map<String, dynamic> toJson() {
    return {
      'cast': cast,
      'avatar': avatar,
      'nameFilm': nameFilm,
    };
  }
}
