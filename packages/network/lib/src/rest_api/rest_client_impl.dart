part of 'rest_client.dart';

class _RESTClientImpl implements RESTClient {
  const _RESTClientImpl({
    required Uri baseUrl,
    required Client client,
    required RESTRequestInterceptor? interceptor,
  })  : _baseUrl = baseUrl,
        _httpClient = client,
        _interceptor = interceptor;

  factory _RESTClientImpl.withSecretKeyProvider({
    required String baseUrl,
    required SecretKeyProvider secretKeyProvider,
    Client? client,
  }) {
    return _RESTClientImpl(
      baseUrl: Uri.parse(baseUrl),
      client: client ?? Client(),
      interceptor: RESTRequestInterceptor.createWith(
        secretKeyProvider: secretKeyProvider,
      ),
    );
  }

  final Uri _baseUrl;

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

    final Uri uri = _baseUrl.replace(
      path: _baseUrl.path + endpoint,
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
