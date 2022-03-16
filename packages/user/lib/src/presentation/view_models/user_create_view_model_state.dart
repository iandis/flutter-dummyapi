part of 'user_create_view_model.dart';

class UserCreateViewModelState extends BaseViewModelState {
  const UserCreateViewModelState({
    required this.isLoading,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isCreateUserSuccess,
    this.errorMessage,
  });

  const UserCreateViewModelState.init()
      : isLoading = false,
        firstName = '',
        lastName = '',
        email = '',
        isCreateUserSuccess = false,
        errorMessage = null;

  @override
  final bool isLoading;

  final String firstName;

  final String lastName;

  final String email;

  final bool isCreateUserSuccess;

  @override
  final String? errorMessage;

  bool get canCreateUser {
    return firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty;
  }

  UserCreateViewModelState copyWith({
    bool? isLoading,
    String? firstName,
    String? lastName,
    String? email,
    bool? isCreateUserSuccess,
    String? errorMessage,
  }) {
    return UserCreateViewModelState(
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isCreateUserSuccess: isCreateUserSuccess ?? this.isCreateUserSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        firstName,
        lastName,
        email,
        isCreateUserSuccess,
        errorMessage,
      ];
}
