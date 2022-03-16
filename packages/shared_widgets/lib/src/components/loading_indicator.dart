import 'package:flutter/cupertino.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.color,
    this.size = 10.0,
  }) : super(key: key);

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: color,
      radius: size,
    );
  }
}
