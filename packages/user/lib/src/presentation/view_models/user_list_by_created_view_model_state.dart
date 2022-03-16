part of 'user_list_by_created_view_model.dart';

class UserListByCreatedViewModelState extends BaseViewModelWithPaginationState {
  const UserListByCreatedViewModelState({
    required this.status,
    required this.currentPage,
    required this.isAtEndOfPage,
    required this.users,
    this.errorMessage,
  });

  const UserListByCreatedViewModelState.init()
      : status = ViewModelStatus.init,
        currentPage = 0,
        isAtEndOfPage = false,
        users = const <User>[],
        errorMessage = null;

  @override
  final ViewModelStatus status;

  @override
  final int currentPage;

  @override
  final bool isAtEndOfPage;

  final List<User> users;

  @override
  final String? errorMessage;

  UserListByCreatedViewModelState copyWith({
    ViewModelStatus? status,
    int? currentPage,
    bool? isAtEndOfPage,
    List<User>? users,
    String? errorMessage,
  }) {
    return UserListByCreatedViewModelState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      isAtEndOfPage: isAtEndOfPage ?? this.isAtEndOfPage,
      users: users ?? this.users,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentPage,
        isAtEndOfPage,
        users,
        errorMessage,
      ];
}
