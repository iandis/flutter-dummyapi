import 'package:flutter_test/flutter_test.dart';
import 'package:post/src/domain/actions/_actions.dart';
import 'package:post/src/domain/entities/post.dart';
import 'package:post/src/domain/inputs/post_list_input.dart';

void testDoGetPostList(DoGetPostList doGetPostList) {
  test(
    '[DoGetPostList] When page = 0 and limit = 10, \n'
    'then return a list of 10 [Post]s from page 0.',
    () async {
      const int limit = 10;
      const PostListInput input = PostListInput(
        page: 0,
        limit: limit,
      );
      final List<Post> posts = await doGetPostList(input);
      expect(posts, isNotEmpty);
      expect(posts.length, equals(limit));
    },
  );
}
