part of 'post_list_by_tag_view_model.dart';

class PostListByTagViewModelState extends PostListViewModelState {
  const PostListByTagViewModelState({
    required ViewModelStatus status,
    required int currentPage,
    required bool isAtEndOfPage,
    required List<Post> posts,
    required this.currentTag,
    String? errorMessage,
  }) : super(
          status: status,
          currentPage: currentPage,
          isAtEndOfPage: isAtEndOfPage,
          posts: posts,
          errorMessage: errorMessage,
        );

  factory PostListByTagViewModelState.init() {
    return const PostListByTagViewModelState(
      status: ViewModelStatus.init,
      currentPage: 0,
      isAtEndOfPage: false,
      posts: <Post>[],
      currentTag: '',
      errorMessage: null,
    );
  }

  final String currentTag;

  @override
  PostListByTagViewModelState copyWith({
    ViewModelStatus? status,
    int? currentPage,
    bool? isAtEndOfPage,
    String? errorMessage,
    List<Post>? posts,
    String? currentTag,
  }) {
    return PostListByTagViewModelState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      isAtEndOfPage: isAtEndOfPage ?? this.isAtEndOfPage,
      posts: posts ?? this.posts,
      currentTag: currentTag ?? this.currentTag,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[...super.props, currentTag];
}
