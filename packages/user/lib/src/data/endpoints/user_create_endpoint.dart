import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../domain/entities/user.dart';

@internal
@lazySingleton
class UserCreateEndpoint extends CancelableRESTEndpoint<User> {
  @internal
  UserCreateEndpoint({
    required RESTClient restClient,
  }) : super(
          restClient: restClient,
          parser: const _UserListByCreatedResponseParser(),
        );

  @override
  String get endpoint => '/user/create';

  @override
  RequestType get requestType => RequestType.post;
}

class _UserListByCreatedResponseParser extends RESTResponseParser<User> {
  const _UserListByCreatedResponseParser();

  @override
  User parse(dynamic data) {
    return User.fromJson(data as Map<String, dynamic>);
  }
}
