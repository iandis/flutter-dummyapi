import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';

abstract class RESTResponseParser<T extends Object?> {
  static Exception convertErrorCodeToException({
    required int errorCode,
    required String responseBody,
  }) {
    if (errorCode >= 500 && errorCode <= 599) {
      return ServerError(responseBody: responseBody);
    }

    return RequestError(responseBody: responseBody);
  }

  static O parseJsonData<O, D>(
    String jsonString,
    O Function(D data) parserFn,
  ) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return parserFn(jsonMap['data'] as D);
  }

  @alwaysThrows
  Never onError(
    Exception exception,
    StackTrace stackTrace,
  ) {
    log(
      'An error occurred when requesting to server.',
      name: runtimeType.toString(),
      error: exception,
      stackTrace: stackTrace,
    );
    throw exception;
  }

  Future<T> parse(Response httpResponse);
}
