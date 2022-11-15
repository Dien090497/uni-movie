import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/router/app_routes.dart';
import 'package:movie_app/common/style/text_styles.dart';
import 'package:movie_app/features/home/domain/entities/cast_entity.dart';
import 'package:movie_app/features/home/domain/entities/movies_entity.dart';
import 'package:movie_app/features/home/presenter/page/view_all_detail_movie_page.dart';
import 'package:movie_app/features/home/presenter/widgets/item_cast_widget.dart';
import 'package:movie_app/features/home/presenter/widgets/video_detail_movie.dart';

class DetailMoviePageArguments {
  final MovieEntity movieEntity;

  DetailMoviePageArguments({required this.movieEntity});
}

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as DetailMoviePageArguments?;
    final int countCast = args?.movieEntity.castAndCrew.length ?? 4;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              actions: [
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.share),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: VideoDetailMovieWidget(
                          url: '${args?.movieEntity.videos[0]}',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          args?.movieEntity.avatar ?? '',
                          fit: BoxFit.fitWidth,
                          width: 164.w,
                          height: 250.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              pinned: false,
              stretch: false,
              expandedHeight: 379.h,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 32.h, bottom: 16.h),
                      child: Text(
                        args?.movieEntity.name.toString() ?? '',
                        style: TextStyles.h2Semibold,
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: Text(
                        args?.movieEntity.des.toString() ?? '',
                        style: TextStyles.h3,
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: Text(
                        args?.movieEntity.toStringCast() ?? '',
                        style: TextStyles.h3,
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: Text(
                        '${args?.movieEntity.rate.toString()} ★',
                        style: TextStyles.h1Medium,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 32.h, bottom: 16.h),
                            child: Text(
                              'Synopsis',
                              style: TextStyles.h1Medium,
                            )),
                        Container(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Text(
                              '${args?.movieEntity.synopsis}',
                              style: TextStyles.h4,
                            )),
                        Container(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cast & Crew',
                                  style: TextStyles.h1Medium,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, R.CastAndCrewPage,
                                        arguments: ViewAllDetailMoviePageArguments(
                                            casts: args?.movieEntity.castAndCrew ?? [],
                                            type: 'Cast & Crew'
                                        ));
                                  },
                                  child: Text(
                                    'View All',
                                    style: TextStyles.h4MediumLightBlue,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          height: 252.h,
                          child: ListView.builder(
                              itemCount: countCast,
                              itemBuilder: (context, index) {
                                return ItemCastWidget(
                                    castEntity:
                                        args?.movieEntity.castAndCrew[index] ??
                                            CastEntity(
                                                cast: '',
                                                avatar: '',
                                                nameFilm: ''));
                              }),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Photos',
                                  style: TextStyles.h1Medium,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, R.CastAndCrewPage,
                                        arguments: ViewAllDetailMoviePageArguments(
                                            photos: args?.movieEntity.photos ?? [],
                                            type: 'Photo'
                                        ));
                                  },
                                  child: Text(
                                    'View All',
                                    style: TextStyles.h4MediumLightBlue,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          height: 72.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: countCast,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.w),
                                    child: Image.network(
                                      args?.movieEntity.photos[index] ?? '',
                                      width: 104.w,
                                      height: 72.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 16.h, top: 24.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Videos',
                                  style: TextStyles.h1Medium,
                                ),
                                Text(
                                  'View All',
                                  style: TextStyles.h4MediumLightBlue,
                                ),
                              ],
                            )),
                        // Container(
                        //   height: 72.h,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: args?.movieEntity.videos.length,
                        //       itemBuilder: (context, index) {
                        //         VideoPlayerController controller =
                        //         VideoPlayerController.network(
                        //             args?.movieEntity.videos[index] ?? '')
                        //           ..initialize().then((_) {});
                        //
                        //         return Container(
                        //           width: 104.w,
                        //           height: 72.w,
                        //           margin: EdgeInsets.only(right: 8.w),
                        //           color: Colors.red,
                        //           child: VideoPlayer(controller),
                        //         );
                        //       }),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
