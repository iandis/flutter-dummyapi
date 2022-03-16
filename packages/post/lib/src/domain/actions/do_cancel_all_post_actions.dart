import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../repositories/post_repository.dart';

@lazySingleton
class DoCancelAllPostActions implements Action<void, void> {
  const DoCancelAllPostActions(this._postRepository);

  final PostRepository _postRepository;

  @override
  void call([void input]) {
    _postRepository.cancelAll();
  }
}
