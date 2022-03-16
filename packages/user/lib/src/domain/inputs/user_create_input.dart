class UserCreateInput {
  const UserCreateInput({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String firstName;

  final String lastName;

  final String email;

  Map<String, dynamic> get body {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
