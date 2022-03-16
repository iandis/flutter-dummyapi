import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'user_image_placeholder.dart';

class UserCircleImage extends StatelessWidget {
  const UserCircleImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 20,
      maxRadius: 21,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: imageUrl.isEmpty
            ? const UserImagePlaceholder()
            : CachedNetworkImage(
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                imageUrl: imageUrl,
                placeholder: (_, __) => const UserImagePlaceholder(),
                errorWidget: (_, __, ___) {
                  return const UserImagePlaceholder();
                },
              ),
      ),
    );
  }
}
