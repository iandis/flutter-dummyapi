import 'package:flutter/material.dart';

class UserImagePlaceholder extends StatelessWidget {
  const UserImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey[100]!,
      child: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
    );
  }
}
