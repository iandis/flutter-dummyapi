part of 'post_item.dart';

final Widget _userImagePlaceholder = ColoredBox(
  color: Colors.grey[100]!,
  child: const Icon(
    Icons.person,
    color: Colors.grey,
  ),
);

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
          CircleAvatar(
            minRadius: 20,
            maxRadius: 21,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                imageUrl: user.imageUrl,
                placeholder: (_, __) => _userImagePlaceholder,
                errorWidget: (_, __, ___) {
                  return _userImagePlaceholder;
                },
              ),
            ),
          ),
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
