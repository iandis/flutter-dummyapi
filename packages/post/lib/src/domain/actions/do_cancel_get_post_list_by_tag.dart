import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../repositories/post_repository.dart';

@lazySingleton
class DoCancelGetPostListByTag implements Action<void, void> {
  const DoCancelGetPostListByTag(this._postRepository);

  final PostRepository _postRepository;

  @override
  void call([void input]) {
    _postRepository.cancel(PostRepositoryActionType.getPostsByTag);
  }
}
