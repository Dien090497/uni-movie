import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/style/text_styles.dart';
import 'package:movie_app/features/home/domain/entities/cast_entity.dart';

class ItemCastWidget extends StatelessWidget {
  final CastEntity castEntity;
  const ItemCastWidget({Key? key, required this.castEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(castEntity.cast.isNotEmpty){
      return Container(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.w),
              child: Image.network(
                castEntity.avatar,
                width: 48.w,
                height: 48.w,
                fit:  BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(castEntity.cast, style: TextStyles.h4Medium,),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                child: Text('•••    ${castEntity.nameFilm.toUpperCase()}', overflow: TextOverflow.ellipsis,),
              )
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
