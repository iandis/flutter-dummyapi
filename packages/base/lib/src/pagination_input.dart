class PaginationInput {
  const PaginationInput({
    required this.page,
    this.limit = 10,
  });

  final int page;

  final int limit;

  Map<String, String> get toMap {
    return <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
    };
  }
}
