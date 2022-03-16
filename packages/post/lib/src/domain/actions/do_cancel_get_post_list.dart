import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../repositories/post_repository.dart';

@lazySingleton
class DoCancelGetPostList implements Action<void, void> {
  const DoCancelGetPostList(this._postRepository);

  final PostRepository _postRepository;

  @override
  void call([void input]) {
    _postRepository.cancel(PostRepositoryActionType.getPosts);
  }
}
