import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../data/endpoints/post_list_by_tag_endpoint.dart';
import '../../data/endpoints/post_list_endpoint.dart';
import '../entities/post.dart';
import '../inputs/post_list_input.dart';

part 'post_repository_impl.dart';

enum PostRepositoryActionType {
  getPosts,
  getPostsByTag,
}

@internal
@lazySingleton
abstract class PostRepository {
  @internal
  @factoryMethod
  const factory PostRepository({
    required PostListEndpoint postListEndpoint,
    required PostListByTagEndpoint postListByTagEndpoint,
  }) = _PostRepositoryImpl;

  Future<List<Post>> getPosts(PostListInput input);

  Future<List<Post>> getPostsByTag(PostListInput input);

  void cancel(PostRepositoryActionType type);

  void cancelAll();
}
