import 'dart:developer';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

abstract class RESTResponseParser<T extends Object?> {
  @alwaysThrows
  Never onError(Object error, StackTrace stackTrace) {
    log(
      'An error occurred when requesting to server.',
      name: runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
    throw error;
  }

  Future<T> parse(Response httpResponse);
}
