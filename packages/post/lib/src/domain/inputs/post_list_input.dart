import 'package:base/base.dart';

class PostListInput extends PaginationInput {
  const PostListInput({
    required int page,
    int limit = 5,
  })  : tag = null,
        super(page: page, limit: limit);

  const PostListInput.byTag({
    required int page,
    int limit = 5,
    required this.tag,
  }) : super(page: page, limit: limit);

  final String? tag;

  Map<String, String> get queryParameters => super.toMap;

  Map<String, String> get queryVariables {
    if (tag == null) {
      throw ArgumentError.notNull('tag');
    }

    return <String, String>{
      'tag': tag!,
    };
  }
}
