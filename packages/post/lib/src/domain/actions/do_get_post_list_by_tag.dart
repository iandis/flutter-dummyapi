import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../entities/post.dart';
import '../inputs/post_list_input.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class DoGetPostListByTag implements Action<PostListInput, List<Post>> {
  const DoGetPostListByTag(this._postRepository);

  final PostRepository _postRepository;

  @override
  Future<List<Post>> call(PostListInput input) {
    return _postRepository.getPostsByTag(input);
  }
}
