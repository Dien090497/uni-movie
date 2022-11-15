import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/router/app_routes.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';
import 'package:movie_app/features/home/presenter/page/detail_movie.dart';

class HomeListMovieWidget extends StatefulWidget {
  final List<MovieEntity> movies;

  const HomeListMovieWidget({Key? key, required this.movies}) : super(key: key);

  @override
  State<HomeListMovieWidget> createState() => _MCSearchTextFieldState();
}

class _MCSearchTextFieldState extends State<HomeListMovieWidget> {
  
  _detailMovie(MovieEntity movie){
    Navigator.pushNamed(
        context, R.DetailMovie, arguments: DetailMoviePageArguments(
        movieEntity: movie
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        mainAxisExtent: 327.h,
        // childAspectRatio: 1.1, DONT USE THIS when using mainAxisExtent
      ),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: widget.movies.length,
      itemBuilder: (_, position) => InkWell(
        onTap: () {_detailMovie(widget.movies[position]); },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.movies[position].avatar,
              fit: BoxFit.cover,
              height: 250.h,
              width: double.infinity,
            ),
            Row(
              children: [
                Container(
                  height: 14.h,
                  width: 14.h,
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
                ),
                Container(
                  height: 14.h,
                  width: 14.h,
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
                ),
                Container(
                  height: 14.h,
                  width: 14.h,
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
                ),
                Container(
                  height: 14.h,
                  width: 14.h,
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
                ),
                Container(
                  height: 14.h,
                  width: 14.h,
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
                ),
              ],
            ),
            Text(widget.movies[position].name),
            Text(widget.movies[position].des),
          ],
        ),
      ),
    );
  }
}
