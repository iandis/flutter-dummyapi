import 'dart:async';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../entities/user.dart';
import '../inputs/user_create_input.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class DoCreateUser extends Action<UserCreateInput, User> {
  const DoCreateUser(this._userRepository);

  final UserRepository _userRepository;

  @override
  FutureOr<User> call(UserCreateInput input) {
    return _userRepository.createUser(input);
  }
}
