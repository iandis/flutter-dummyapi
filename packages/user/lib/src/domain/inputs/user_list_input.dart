import 'package:base/base.dart';

class UserListInput extends PaginationInput {
  const UserListInput.byCreated({
    required int page,
    int limit = 20,
  })  : filterByCreated = true,
        super(
          page: page,
          limit: limit,
        );

  final bool filterByCreated;

  Map<String, String> get queryParameters {
    return <String, String>{
      ...super.toMap,
      'created': filterByCreated ? '1' : '0',
    };
  }
}
