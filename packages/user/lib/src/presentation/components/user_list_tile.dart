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
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).backgroundColor.withAlpha(100),
      ),
      child: Row(
        children: <Widget>[
          UserCircleImage(imageUrl: user.imageUrl),
          const SizedBox(width: 10.0),
          Flexible(
            child: Text(
              user.fullName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
