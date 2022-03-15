import 'package:http/http.dart';
import 'package:meta/meta.dart';

import 'request_type.dart';
import 'rest_client.dart';
import 'rest_request.dart';
import 'rest_response_parser.dart';

abstract class RESTEndpoint<T extends Object?> {
  const RESTEndpoint({
    required RESTClient restClient,
    required RESTResponseParser<T> parser,
  })  : _restClient = restClient,
        _parser = parser;

  final RESTClient _restClient;

  final RESTResponseParser<T> _parser;

  String get endpoint;

  RequestType get requestType;

  Future<T> execute(RESTRequest request) async {
    final Response response = await _restClient.createRequest(
      requestType,
      endpoint,
      request,
    );

    if (response.statusCode != 200) {
      _parser.onError(
        RESTResponseParser.convertErrorCodeToException(
          errorCode: response.statusCode,
          responseBody: response.body,
        ),
        StackTrace.current,
      );
    }

    return _parser.parse(response);
  }
}

abstract class CancelableRESTEndpoint<T extends Object?>
    extends RESTEndpoint<T> {
  CancelableRESTEndpoint({
    required RESTClient restClient,
    required RESTResponseParser<T> parser,
  }) : super(restClient: restClient, parser: parser);

  Client? _httpClient;

  @override
  Future<T> execute(
    RESTRequest request, {
    bool isCancelable = false,
  }) async {
    cancel();

    if (isCancelable) {
      _httpClient = Client();
    }

    final Response response = await _restClient.createRequest(
      requestType,
      endpoint,
      request,
      httpClient: _httpClient,
    );

    cancel();

    if (response.statusCode != 200) {
      _parser.onError(
        RESTResponseParser.convertErrorCodeToException(
          errorCode: response.statusCode,
          responseBody: response.body,
        ),
        StackTrace.current,
      );
    }

    return _parser.parse(response);
  }

  @nonVirtual
  void cancel() {
    _httpClient?.close();
    _httpClient = null;
  }
}
