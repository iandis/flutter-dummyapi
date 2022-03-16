import 'dart:developer';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../../domain/actions/do_cancel_get_post_list.dart';
import '../../domain/actions/do_get_post_list.dart';
import '../../domain/entities/post.dart';
import '../../domain/inputs/post_list_input.dart';

part 'post_list_view_model_state.dart';

@injectable
class PostListViewModel extends BaseViewModel<PostListViewModelState> {
  PostListViewModel({
    required DoGetPostList doGetPostList,
    required DoCancelGetPostList doCancelGetPostList,
  })  : _doGetPostList = doGetPostList,
        _doCancelGetPostList = doCancelGetPostList,
        super(const PostListViewModelState.init());

  final DoGetPostList _doGetPostList;

  final DoCancelGetPostList _doCancelGetPostList;

  Future<void> getPostList({
    bool isMore = false,
  }) async {
    if (state.isBusy || (isMore && state.isAtEndOfPage)) return;

    final int nextPage = isMore ? state.currentPage + 1 : 0;

    state = state.copyWith(
      status: isMore ? ViewModelStatus.loadingMore : ViewModelStatus.loading,
      isAtEndOfPage: false,
    );

    try {
      final PostListInput input = PostListInput(page: nextPage);
      final List<Post> posts = await _doGetPostList(input);
      state = state.copyWith(
        currentPage: nextPage,
        status: ViewModelStatus.loaded,
        posts: isMore ? state.posts + posts : posts,
        isAtEndOfPage: posts.isEmpty,
      );
    } catch (error, stackTrace) {
      log(
        'An error caught on $runtimeType.',
        name: 'getPostList',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        status: ViewModelStatus.error,
        errorMessage: error.toString(),
        isAtEndOfPage: false,
      );
    }
  }

  @override
  void dispose() {
    _doCancelGetPostList();
    super.dispose();
  }
}
