import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

import '../../data/endpoints/user_create_endpoint.dart';
import '../../data/endpoints/user_list_by_created_endpoint.dart';
import '../entities/user.dart';
import '../inputs/user_create_input.dart';
import '../inputs/user_list_input.dart';

part 'user_repository_impl.dart';

enum UserRepositoryActionType {
  createUser,
  getUsersByCreated,
}

@internal
@lazySingleton
abstract class UserRepository {
  @internal
  @factoryMethod
  const factory UserRepository({
    required UserCreateEndpoint userCreateEndpoint,
    required UserListByCreatedEndpoint userListByCreatedEndpoint,
  }) = _UserRepositoryImpl;

  Future<User> createUser(UserCreateInput input);

  Future<List<User>> getUsersByCreated(UserListInput input);

  void cancel(UserRepositoryActionType actionType);

  void cancelAll();
}
