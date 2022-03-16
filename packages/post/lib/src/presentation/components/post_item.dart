import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user/user.dart';

import '../../domain/entities/post.dart';

part 'post_item_description.dart';
part 'post_item_header.dart';
part 'post_item_tag.dart';

final Widget _postImagePlaceholder = ColoredBox(
  color: Colors.grey[100]!,
  child: const SizedBox(
    height: 200,
    child: Center(
      child: Icon(
        Icons.photo,
        size: 30,
      ),
    ),
  ),
);

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
    required this.onTagPressed,
  }) : super(key: key);

  final Post post;

  final void Function(String tag)? onTagPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 1.0,
            child: ColoredBox(color: Colors.grey[300]!),
          ),
          const SizedBox(height: 10),
          _PostItemHeader(user: post.user),
          const SizedBox(height: 10),
          CachedNetworkImage(
            fit: BoxFit.contain,
            // We need to constrain the max. image width
            // that will be cached in memory. Otherwise it'll
            // not be good for the user's RAM.
            memCacheWidth: 400,
            placeholder: (_, __) => _postImagePlaceholder,
            imageUrl: post.imageUrl,
            errorWidget: (_, __, ___) {
              return _postImagePlaceholder;
            },
          ),
          _PostItemDescription(
            post: post,
            onTagPressed: onTagPressed,
          ),
        ],
      ),
    );
  }
}
