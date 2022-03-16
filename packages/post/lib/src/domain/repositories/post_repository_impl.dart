part of 'post_repository.dart';

class _PostRepositoryImpl implements PostRepository {
  const _PostRepositoryImpl({
    required PostListEndpoint postListEndpoint,
    required PostListByTagEndpoint postListByTagEndpoint,
  })  : _postListEndpoint = postListEndpoint,
        _postListByTagEndpoint = postListByTagEndpoint;

  final PostListEndpoint _postListEndpoint;

  final PostListByTagEndpoint _postListByTagEndpoint;

  @override
  Future<List<Post>> getPosts(PostListInput input) {
    final RESTRequest request = RESTRequest(
      queryParameters: input.queryParameters,
    );

    return _postListEndpoint.execute(
      request,
      isCancelable: true,
    );
  }

  @override
  Future<List<Post>> getPostsByTag(PostListInput input) {
    final RESTRequest request = RESTRequest(
      queryParameters: input.queryParameters,
      queryVariables: input.queryVariables,
    );

    return _postListByTagEndpoint.execute(
      request,
      isCancelable: true,
    );
  }

  @override
  void cancel(PostRepositoryActionType type) {
    switch (type) {
      case PostRepositoryActionType.getPosts:
        _postListEndpoint.cancel();
        break;
      case PostRepositoryActionType.getPostsByTag:
        _postListByTagEndpoint.cancel();
        break;
    }
  }

  @override
  void cancelAll() {
    _postListEndpoint.cancel();
    _postListByTagEndpoint.cancel();
  }
}
