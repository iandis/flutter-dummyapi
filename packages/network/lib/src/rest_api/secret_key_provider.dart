import 'dart:async' show FutureOr;

abstract class SecretKeyProvider {
  factory SecretKeyProvider.create({
    String? secretKey,
  }) = _DefaultSecretKeyProvider;

  FutureOr<String?> getSecretKey();

  FutureOr<void> setSecretKey(String? newToken);
}

class _DefaultSecretKeyProvider implements SecretKeyProvider {
  _DefaultSecretKeyProvider({
    String? secretKey,
  }) : _secretKey = secretKey;

  String? _secretKey;

  @override
  String? getSecretKey() => _secretKey;

  @override
  void setSecretKey(String? newSecretKey) {
    _secretKey = newSecretKey;
  }
}
