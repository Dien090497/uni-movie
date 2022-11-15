import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/domain/entities/cast_entity.dart';

class MovieEntity extends Equatable {
  final String id;
  final String avatar;
  final String name;
  final String des;
  final double rate;
  final String synopsis;
  final List<CastEntity> castAndCrew;
  final List<String> photos;
  final List<String> videos;

  MovieEntity({
    required this.id,
    required this.name,
    required this.des,
    required this.rate,
    required this.avatar,
    required this.synopsis,
    required this.castAndCrew,
    required this.photos,
    required this.videos,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, des, rate, avatar, synopsis, castAndCrew, photos, videos];

  String toStringCast() {
    if(castAndCrew.length > 3){
      return '${castAndCrew[0].cast}, ${castAndCrew[1].cast}, ${castAndCrew[2].cast}';
    } else if(castAndCrew.length == 2){
      return '${castAndCrew[0].cast}, ${castAndCrew[1].cast}}';
    } else if(castAndCrew.length == 1){
      return castAndCrew[0].cast;
    } else {
      return '';
    }
  }
}
