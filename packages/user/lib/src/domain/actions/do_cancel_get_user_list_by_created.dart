import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../repositories/user_repository.dart';

@lazySingleton
class DoCancelGetUserListByCreated extends Action<void, void> {
  const DoCancelGetUserListByCreated(this._userRepository);

  final UserRepository _userRepository;

  @override
  void call([void input]) {
    _userRepository.cancel(UserRepositoryActionType.getUsersByCreated);
  }
}
