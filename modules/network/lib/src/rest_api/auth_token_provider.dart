import 'dart:async' show FutureOr;

abstract class AuthTokenProvider {
  factory AuthTokenProvider.create({
    String? authToken,
  }) = _DefaultAuthTokenProvider;

  FutureOr<String?> getToken();

  FutureOr<void> setToken(String? newToken);
}

class _DefaultAuthTokenProvider implements AuthTokenProvider {
  _DefaultAuthTokenProvider({
    String? authToken,
  }) : _token = authToken;

  String? _token;

  @override
  String? getToken() => _token;

  @override
  FutureOr<void> setToken(String? newToken) {
    _token = newToken;
  }
}
