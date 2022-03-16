import 'dart:developer';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/actions/do_cancel_create_user.dart';
import '../../domain/actions/do_create_user.dart';
import '../../domain/inputs/user_create_input.dart';

part 'user_create_view_model_state.dart';

@internal
@injectable
class UserCreateViewModel extends BaseViewModel<UserCreateViewModelState> {
  @internal
  UserCreateViewModel({
    required DoCreateUser doCreateUser,
    required DoCancelCreateUser doCancelCreateUser,
  })  : _doCreateUser = doCreateUser,
        _doCancelCreateUser = doCancelCreateUser,
        super(const UserCreateViewModelState.init());

  final DoCreateUser _doCreateUser;

  final DoCancelCreateUser _doCancelCreateUser;

  void setUserFirstName(String firstName) {
    if (state.isBusy) return;
    state = state.copyWith(firstName: firstName);
  }

  void setUserLastName(String lastName) {
    if (state.isBusy) return;
    state = state.copyWith(lastName: lastName);
  }

  void setUserEmail(String email) {
    if (state.isBusy) return;
    state = state.copyWith(email: email);
  }

  Future<void> createUser() async {
    if (state.isBusy || !state.canCreateUser) return;

    state = state.copyWith(
      isLoading: true,
      isCreateUserSuccess: false,
    );

    try {
      final UserCreateInput input = UserCreateInput(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
      );
      await _doCreateUser(input);
      state = state.copyWith(
        isLoading: false,
        isCreateUserSuccess: true,
      );
    } catch (error, stackTrace) {
      log(
        'An error caught on $runtimeType.',
        name: 'getPostList',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
        isCreateUserSuccess: false,
      );
    }
  }

  @override
  void dispose() {
    _doCancelCreateUser();
    super.dispose();
  }
}
