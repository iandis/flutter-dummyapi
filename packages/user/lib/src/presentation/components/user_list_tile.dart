import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import 'user_circle_image.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserCircleImage(imageUrl: user.imageUrl),
      title: Text(user.fullName),
    );
  }
}
