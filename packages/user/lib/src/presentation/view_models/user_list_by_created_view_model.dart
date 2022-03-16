import 'dart:developer';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/actions/do_cancel_get_user_list_by_created.dart';
import '../../domain/actions/do_get_user_list_by_created.dart';
import '../../domain/entities/user.dart';
import '../../domain/inputs/user_list_input.dart';

part 'user_list_by_created_view_model_state.dart';

@internal
@injectable
class UserListByCreatedViewModel
    extends BaseViewModel<UserListByCreatedViewModelState> {
  @internal
  UserListByCreatedViewModel({
    required DoGetUserListByCreated doGetUserListByCreated,
    required DoCancelGetUserListByCreated doCancelGetUserListByCreated,
  })  : _doGetUserListByCreated = doGetUserListByCreated,
        _doCancelGetUserListByCreated = doCancelGetUserListByCreated,
        super(const UserListByCreatedViewModelState.init());

  final DoGetUserListByCreated _doGetUserListByCreated;

  final DoCancelGetUserListByCreated _doCancelGetUserListByCreated;

  Future<void> getUserList({
    bool isMore = false,
  }) async {
    if (state.isBusy || (isMore && state.isAtEndOfPage)) return;

    final int nextPage = isMore ? state.currentPage + 1 : 0;

    state = state.copyWith(
      status: isMore ? ViewModelStatus.loadingMore : ViewModelStatus.loading,
      isAtEndOfPage: false,
    );

    try {
      const int limit = 20;
      final UserListInput input = UserListInput.byCreated(
        page: nextPage,
        limit: limit,
      );
      final List<User> users = await _doGetUserListByCreated(input);
      state = state.copyWith(
        currentPage: nextPage,
        status: ViewModelStatus.loaded,
        users: isMore ? state.users + users : users,
        isAtEndOfPage: users.isEmpty || users.length < limit,
      );
    } catch (error, stackTrace) {
      log(
        'An error caught on $runtimeType.',
        name: 'getPostList',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        status: ViewModelStatus.error,
        errorMessage: error.toString(),
        isAtEndOfPage: false,
      );
    }
  }

  @override
  void dispose() {
    _doCancelGetUserListByCreated();
    super.dispose();
  }
}
