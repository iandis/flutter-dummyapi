import 'dart:async';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../entities/user.dart';
import '../inputs/user_list_input.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class DoGetUserListByCreated extends Action<UserListInput, List<User>> {
  const DoGetUserListByCreated(this._userRepository);

  final UserRepository _userRepository;

  @override
  FutureOr<List<User>> call(UserListInput input) {
    return _userRepository.getUsersByCreated(input);
  }
}
