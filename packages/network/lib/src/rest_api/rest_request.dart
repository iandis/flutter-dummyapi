class RESTRequest {
  const RESTRequest({
    this.headers,
    this.queryParameters,
    this.body,
  });

  final Map<String, String>? headers;

  final Map<String, String>? queryParameters;

  final Map<String, dynamic>? body;
}
