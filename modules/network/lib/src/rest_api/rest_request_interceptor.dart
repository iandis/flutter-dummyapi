import 'dart:async';

import 'auth_token_provider.dart';
import 'rest_request.dart';

abstract class RESTRequestInterceptor {
  const factory RESTRequestInterceptor.createWith({
    required AuthTokenProvider authTokenProvider,
  }) = _DefaultRESTRequestInterceptor;

  FutureOr<RESTRequest> onRequest(RESTRequest current);
}

class _DefaultRESTRequestInterceptor implements RESTRequestInterceptor {
  const _DefaultRESTRequestInterceptor({
    required AuthTokenProvider authTokenProvider,
  }) : _authTokenProvider = authTokenProvider;

  final AuthTokenProvider _authTokenProvider;

  @override
  Future<RESTRequest> onRequest(RESTRequest current) async {
    final String? authToken = await _authTokenProvider.getToken();

    if (authToken == null) {
      return current;
    }

    RESTRequest request = current;

    if (request.headers != null) {
      request.headers!['app-id'] = authToken;
    } else {
      request = RESTRequest(
        headers: <String, String>{'app-id': authToken},
        queryParameters: request.queryParameters,
        body: request.body,
      );
    }

    return request;
  }
}
