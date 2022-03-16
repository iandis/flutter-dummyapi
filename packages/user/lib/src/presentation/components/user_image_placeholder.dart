import 'package:flutter/material.dart';

class UserImagePlaceholder extends StatelessWidget {
  const UserImagePlaceholder({
    Key? key,
    this.size = 40,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ColoredBox(
        color: Colors.grey[100]!,
        child: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
    );
  }
}
