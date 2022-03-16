// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      imageUrl: json['image'] as String,
      likesCount: json['likes'] as int? ?? 0,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['text'] as String,
      publishDateISOString: json['publishDate'] as String,
      user: User.fromJson(json['owner'] as Map<String, dynamic>),
    );
