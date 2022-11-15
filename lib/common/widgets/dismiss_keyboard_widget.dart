import 'package:flutter/material.dart';

class DismissKeyboardWidget extends StatelessWidget {
  const DismissKeyboardWidget({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('HIDEEEEEEE');
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
