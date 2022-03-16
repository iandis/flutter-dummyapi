import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../entities/post.dart';
import '../inputs/post_list_input.dart';
import '../repositories/post_repository.dart';

@lazySingleton
class DoGetPostList implements Action<PostListInput, List<Post>> {
  const DoGetPostList(this._postRepository);

  final PostRepository _postRepository;

  @override
  Future<List<Post>> call(PostListInput input) async {
    return _postRepository.getPosts(input);
  }
}
