import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user/user.dart';

part 'post.g.dart';

@JsonSerializable(createToJson: false)
class Post extends Equatable {
  const Post({
    required this.id,
    required this.imageUrl,
    required this.likesCount,
    required this.tags,
    required this.description,
    required this.publishDateISOString,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  final String id;

  @JsonKey(name: 'image')
  final String imageUrl;

  @JsonKey(name: 'likes', defaultValue: 0)
  final int likesCount;

  final List<String> tags;

  @JsonKey(name: 'text')
  final String description;

  @JsonKey(name: 'publishDate')
  final String publishDateISOString;

  @JsonKey(name: 'owner')
  final User user;

  DateTime get publishDate => DateTime.parse(publishDateISOString).toLocal();

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        likesCount,
        tags,
        description,
        publishDateISOString,
        user,
      ];
}
