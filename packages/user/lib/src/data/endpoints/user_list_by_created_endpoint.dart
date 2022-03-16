import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../domain/entities/user.dart';

@internal
@lazySingleton
class UserListByCreatedEndpoint extends CancelableRESTEndpoint<List<User>> {
  @internal
  UserListByCreatedEndpoint({
    required RESTClient restClient,
  }) : super(
          restClient: restClient,
          parser: const _UserListByCreatedResponseParser(),
        );

  @override
  String get endpoint => '/user';

  @override
  RequestType get requestType => RequestType.get;
}

class _UserListByCreatedResponseParser extends RESTResponseParser<List<User>> {
  const _UserListByCreatedResponseParser();

  @override
  List<User> parse(dynamic data) {
    final List<dynamic> userList = data as List<dynamic>;

    return userList.map<User>((dynamic userJson) {
      return User.fromJson(userJson as Map<String, dynamic>);
    }).toList(growable: false);
  }
}
