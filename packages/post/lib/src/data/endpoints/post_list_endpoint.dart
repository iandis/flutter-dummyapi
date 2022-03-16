import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../domain/entities/post.dart';

@internal
@lazySingleton
class PostListEndpoint extends CancelableRESTEndpoint<List<Post>> {
  @internal
  PostListEndpoint({
    required RESTClient restClient,
  }) : super(
          restClient: restClient,
          parser: const PostListResponseParser(),
        );

  @override
  String get endpoint => '/post';

  @override
  RequestType get requestType => RequestType.get;
}

@internal
class PostListResponseParser extends RESTResponseParser<List<Post>> {
  @internal
  const PostListResponseParser();

  @override
  List<Post> parse(dynamic data) {
    final List<dynamic> postList = data as List<dynamic>;

    return postList.map<Post>((dynamic data) {
      return Post.fromJson(data as Map<String, dynamic>);
    }).toList();
  }
}
