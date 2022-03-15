import 'dart:async';

import 'secret_key_provider.dart';
import 'rest_request.dart';

abstract class RESTRequestInterceptor {
  const factory RESTRequestInterceptor.createWith({
    required SecretKeyProvider secretKeyProvider,
  }) = _DefaultRESTRequestInterceptor;

  FutureOr<RESTRequest> onRequest(RESTRequest current);
}

class _DefaultRESTRequestInterceptor implements RESTRequestInterceptor {
  const _DefaultRESTRequestInterceptor({
    required SecretKeyProvider secretKeyProvider,
  }) : _secretKeyProvider = secretKeyProvider;

  final SecretKeyProvider _secretKeyProvider;

  @override
  Future<RESTRequest> onRequest(RESTRequest current) async {
    final String? secretKey = await _secretKeyProvider.getSecretKey();

    if (secretKey == null) {
      return current;
    }

    RESTRequest request = current;

    if (request.headers != null) {
      request.headers!['app-id'] = secretKey;
    } else {
      request = RESTRequest(
        headers: <String, String>{'app-id': secretKey},
        queryParameters: request.queryParameters,
        body: request.body,
      );
    }

    return request;
  }
}
