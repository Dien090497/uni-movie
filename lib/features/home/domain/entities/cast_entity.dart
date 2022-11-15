import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String cast;
  final String avatar;
  final String nameFilm;

  CastEntity({required this.cast, required this.avatar, required this.nameFilm});

  @override
  // TODO: implement props
  List<Object?> get props => [cast, avatar, nameFilm];
}
