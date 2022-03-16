part of 'user_repository.dart';

class _UserRepositoryImpl implements UserRepository {
  const _UserRepositoryImpl({
    required UserCreateEndpoint userCreateEndpoint,
    required UserListByCreatedEndpoint userListByCreatedEndpoint,
  })  : _userCreateEndpoint = userCreateEndpoint,
        _userListByCreatedEndpoint = userListByCreatedEndpoint;

  final UserCreateEndpoint _userCreateEndpoint;

  final UserListByCreatedEndpoint _userListByCreatedEndpoint;

  @override
  Future<User> createUser(UserCreateInput input) {
    final RESTRequest request = RESTRequest(
      body: input.body,
    );

    return _userCreateEndpoint.execute(request);
  }

  @override
  Future<List<User>> getUsersByCreated(UserListInput input) {
    final RESTRequest request = RESTRequest(
      queryParameters: input.queryParameters,
    );

    return _userListByCreatedEndpoint.execute(request);
  }

  @override
  void cancel(UserRepositoryActionType actionType) {
    switch (actionType) {
      case UserRepositoryActionType.createUser:
        _userCreateEndpoint.cancel();
        break;
      case UserRepositoryActionType.getUsersByCreated:
        _userListByCreatedEndpoint.cancel();
        break;
    }
  }

  @override
  void cancelAll() {
    _userCreateEndpoint.cancel();
    _userListByCreatedEndpoint.cancel();
  }
}
