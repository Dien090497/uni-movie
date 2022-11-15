import 'package:flutter/material.dart';

class MCIcon extends StatelessWidget {
  const MCIcon(this.icon,
      {Key? key, this.color, this.width, this.height, this.fit})
      : super(key: key);

  final String icon;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: color,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, e, trace) {
        return const Icon(Icons.error);
      },
    );
  }
}
