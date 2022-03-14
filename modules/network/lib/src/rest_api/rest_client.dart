import 'package:http/http.dart';

import 'auth_token_provider.dart';
import 'request_type.dart';
import 'rest_request.dart';
import 'rest_request_interceptor.dart';

part 'rest_client_impl.dart';

abstract class RESTClient {
  const factory RESTClient({
    required String baseUrl,
    required Client client,
    required RESTRequestInterceptor? interceptor,
  }) = _RESTClientImpl;

  factory RESTClient.withAuthTokenProvider({
    required String baseUrl,
    required AuthTokenProvider authTokenProvider,
    Client? client,
  }) = _RESTClientImpl.withAuthTokenProvider;

  Future<Response> createRequest(
    RequestType type,
    String endpoint,
    RESTRequest request, {
    Client? httpClient,
  });
}