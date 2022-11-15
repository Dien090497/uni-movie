import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/domain/entities/cast_entity.dart';
import 'package:movie_app/features/home/presenter/widgets/item_cast_widget.dart';

class ViewAllDetailMoviePageArguments {
  final List<CastEntity>? casts;
  final List<String>? photos;
  final String type;

  ViewAllDetailMoviePageArguments({this.casts, this.photos, required this.type});
}


class ViewAllDetailMoviePage extends StatelessWidget {
  const ViewAllDetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ViewAllDetailMoviePageArguments?;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args?.type ?? ''),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: args?.type == 'Photo' ? ListView.builder(
            itemCount: args?.photos?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.w),
                  child: Image.network(
                    args?.photos?[index] ?? '',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/3.5,
                    fit:  BoxFit.cover,
                  ),
                ),
              );
            }) : ListView.builder(
            itemCount: args?.casts?.length ?? 0,
            itemBuilder: (context, index) {
              return ItemCastWidget(
                  castEntity:
                  args?.casts?[index] ??
                      CastEntity(
                          cast: '',
                          avatar: '',
                          nameFilm: ''));
            }),
      ),
    );
  }
}
