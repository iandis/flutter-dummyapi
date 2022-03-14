part of 'rest_client.dart';

class _RESTClientImpl implements RESTClient {
  const _RESTClientImpl({
    required String baseUrl,
    required Client client,
    required RESTRequestInterceptor? interceptor,
  })  : _baseUrl = baseUrl,
        _httpClient = client,
        _interceptor = interceptor;

  factory _RESTClientImpl.withAuthTokenProvider({
    required String baseUrl,
    required AuthTokenProvider authTokenProvider,
    Client? client,
  }) {
    return _RESTClientImpl(
      baseUrl: baseUrl,
      client: client ?? Client(),
      interceptor: RESTRequestInterceptor.createWith(
        authTokenProvider: authTokenProvider,
      ),
    );
  }

  final String _baseUrl;

  final Client _httpClient;

  final RESTRequestInterceptor? _interceptor;

  @override
  Future<Response> createRequest(
    RequestType type,
    String endpoint,
    RESTRequest request, {
    Client? httpClient,
  }) async {
    final RESTRequestInterceptor? interceptor = _interceptor;

    if (interceptor != null) {
      request = await interceptor.onRequest(request);
    }

    final Uri uri = Uri(
      host: _baseUrl,
      path: endpoint,
      queryParameters: request.queryParameters,
    );

    return _executeRequest(
      httpClient: httpClient ?? _httpClient,
      uri: uri,
      type: type,
      request: request,
    );
  }

  Future<Response> _executeRequest({
    required Client httpClient,
    required Uri uri,
    required RequestType type,
    required RESTRequest request,
  }) async {
    switch (type) {
      case RequestType.get:
        return await httpClient.get(
          uri,
          headers: request.headers,
        );

      case RequestType.post:
        return await httpClient.post(
          uri,
          body: request.body,
          headers: request.headers,
        );

      case RequestType.put:
        return await httpClient.put(
          uri,
          headers: request.headers,
          body: request.body,
        );

      case RequestType.delete:
        return await httpClient.delete(
          uri,
          headers: request.headers,
          body: request.body,
        );

      case RequestType.patch:
        return await httpClient.patch(
          uri,
          headers: request.headers,
          body: request.body,
        );
    }
  }
}
