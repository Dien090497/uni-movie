import 'package:flutter/material.dart';

class MCText extends Text {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  MCText({Key? key, required this.text, this.textStyle = null, this.textAlign = null}) : super('');

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign, style: textStyle,maxLines: 1, softWrap: true, overflow: TextOverflow.ellipsis,);
  }
}
