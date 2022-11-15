import 'package:flutter/material.dart';
import 'package:movie_app/common/style/app_colors.dart';
import 'package:movie_app/common/widgets/loading/loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context,
            int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven
                  ? Colors.red
                  : Colors.green,
            ),
          );
        },
      ),
    );
  }
}
