part of 'post_list_view_model.dart';

class PostListViewModelState extends BaseViewModelWithPaginationState {
  const PostListViewModelState({
    required this.status,
    required this.currentPage,
    required this.isAtEndOfPage,
    required this.posts,
    this.errorMessage,
  });

  const PostListViewModelState.init()
      : status = ViewModelStatus.init,
        currentPage = 0,
        isAtEndOfPage = false,
        posts = const <Post>[],
        errorMessage = null;

  @override
  final ViewModelStatus status;

  @override
  final int currentPage;

  @override
  final bool isAtEndOfPage;

  @override
  final String? errorMessage;

  final List<Post> posts;

  PostListViewModelState copyWith({
    ViewModelStatus? status,
    int? currentPage,
    bool? isAtEndOfPage,
    String? errorMessage,
    List<Post>? posts,
  }) {
    return PostListViewModelState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      isAtEndOfPage: isAtEndOfPage ?? this.isAtEndOfPage,
      posts: posts ?? this.posts,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentPage,
        isAtEndOfPage,
        posts,
        errorMessage,
      ];
}
