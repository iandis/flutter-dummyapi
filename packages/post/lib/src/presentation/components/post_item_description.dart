part of 'post_item.dart';

class _PostItemDescription extends StatefulWidget {
  const _PostItemDescription({
    Key? key,
    required this.post,
    required this.onTagPressed,
  }) : super(key: key);

  final Post post;

  final void Function(String tag)? onTagPressed;

  @override
  State<_PostItemDescription> createState() => _PostItemDescriptionState();
}

class _PostItemDescriptionState extends State<_PostItemDescription> {
  TextStyle get _bodyText1 => Theme.of(context).textTheme.bodyText1!;
  Widget get _likes {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        const SizedBox(width: 10),
        Text(
          widget.post.likesCount.toString(),
          style: _bodyText1,
        ),
      ],
    );
  }

  Widget get _description {
    final TextStyle usernameTextStyle = _bodyText1.copyWith(
      fontWeight: FontWeight.bold,
    );

    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${widget.post.user.fullName} ',
            style: usernameTextStyle,
          ),
          TextSpan(
            text: widget.post.description,
            style: _bodyText1,
          ),
        ],
      ),
    );
  }

  Widget get _tags {
    if (widget.post.tags.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 5.0,
      children: widget.post.tags.map<Widget>((String tag) {
        return _PostItemTag(
          tag: tag,
          onTagPressed: widget.onTagPressed,
        );
      }).toList(growable: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _likes,
          const SizedBox(height: 10),
          _description,
          const SizedBox(height: 10),
          _tags,
        ],
      ),
    );
  }
}
