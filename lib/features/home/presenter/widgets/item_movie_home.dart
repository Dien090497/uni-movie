import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMovieHomePage extends StatelessWidget {
  const ItemMovieHomePage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5), // Image border
        child: Image.asset(
          url,
          fit: BoxFit.cover,
          height: 136.h,
          width: 107.h,
        ),
      ),
    );
  }
}
