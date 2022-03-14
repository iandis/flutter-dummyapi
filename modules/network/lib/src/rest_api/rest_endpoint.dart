import 'rest_request.dart';

abstract class RESTEndpoint<T extends Object?> {
  Future<T> execute(RESTRequest request);
}

abstract class CancelableRESTEndpoint<T extends Object?>
    extends RESTEndpoint<T> {
  @override
  Future<T> execute(RESTRequest request, {bool isCancelable = false});
}
