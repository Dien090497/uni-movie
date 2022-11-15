import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/style/app_colors.dart';
import 'package:movie_app/common/widgets/dismiss_keyboard_widget.dart';
import 'package:movie_app/common/widgets/loading/loading.dart';
import 'package:movie_app/common/widgets/loading/loading_widget.dart';
import 'package:movie_app/common/widgets/mc_text.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_state.dart';
import 'package:movie_app/features/home/presenter/widgets/list_movie_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Star Movie'),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 17.w),
                  child: InkWell(
                    child: Icon(Icons.search),
                    onTap: () {
                      print('21312');
                    },
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(4.w),
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(color: AppColors.borderBottomBarDark),
                          left:
                              BorderSide(color: AppColors.borderBottomBarDark),
                          right:
                              BorderSide(color: AppColors.borderBottomBarDark),
                          bottom:
                              BorderSide(color: AppColors.borderBottomBarDark),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: AppColors.transparent,
                        tabs: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_circle),
                                MCText(text: 'Now Showing')
                              ],
                            ),
                          ),
                          MCText(text: 'Coming Soonn'),
                        ],
                      )),
                  Expanded(
                    child: BlocConsumer<MovieBloc, MovieState>(
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        if(state is LoadingMovieState){
                          return LoadingWidget();
                        } else if (state is LoadedMovieState){
                          return TabBarView(
                            controller: _tabController,
                            children: [
                              HomeListMovieWidget(movies: state.movies),
                              HomeListMovieWidget(movies: state.movies),
                            ],
                          );
                        }

                        return LoadingWidget();
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
