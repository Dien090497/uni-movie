import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/router/app_routes.dart';
import 'package:movie_app/common/style/styles.dart';
import 'package:movie_app/features/account/presenter/bloc/login_bloc.dart';
import 'package:movie_app/features/account/presenter/bloc/login_event.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/home/presenter/bloc/movie/movie_event.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<MovieBloc>()..add(GetAllMovieEvent())),
          BlocProvider(create: (_) => di.sl<LoginBloc>()),
          // BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>())
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, child) {
              return MaterialApp(
                darkTheme: darkTheme,
                theme: lightTheme,
                title: 'Movies clone',
                home: child,
                routes: AppRoutes.routes,
                initialRoute: R.bottomNavigation,
                debugShowCheckedModeBanner: false,
              );
            }
        )
    );
  }
}