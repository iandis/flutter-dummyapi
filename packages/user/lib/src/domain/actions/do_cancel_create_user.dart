import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../repositories/user_repository.dart';

@lazySingleton
class DoCancelCreateUser extends Action<void, void> {
  const DoCancelCreateUser(this._userRepository);

  final UserRepository _userRepository;

  @override
  void call([void input]) {
    _userRepository.cancel(UserRepositoryActionType.createUser);
  }
}
