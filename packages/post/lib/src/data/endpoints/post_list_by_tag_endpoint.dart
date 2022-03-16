import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../domain/entities/post.dart';
import 'post_list_endpoint.dart';

@internal
@lazySingleton
class PostListByTagEndpoint extends CancelableRESTEndpoint<List<Post>> {
  @internal
  PostListByTagEndpoint({
    required RESTClient restClient,
  }) : super(
          restClient: restClient,
          parser: const PostListResponseParser(),
        );

  @override
  String get endpoint => '/tag/{tag}/post';

  @override
  RequestType get requestType => RequestType.get;
}
