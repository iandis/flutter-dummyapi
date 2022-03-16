part of 'post_item.dart';

/// This contains brief information about the user (image + url)
class _PostItemHeader extends StatelessWidget {
  const _PostItemHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final TextStyle usernameTextStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          UserCircleImage(imageUrl: user.imageUrl),
          const SizedBox(width: 10),
          Text(
            user.fullName,
            style: usernameTextStyle,
          ),
        ],
      ),
    );
  }
}
