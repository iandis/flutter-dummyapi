import 'dart:developer';

import 'package:base/base.dart';
import 'package:injectable/injectable.dart';

import '../../domain/actions/do_cancel_get_post_list_by_tag.dart';
import '../../domain/actions/do_get_post_list_by_tag.dart';
import '../../domain/entities/post.dart';
import '../../domain/inputs/post_list_input.dart';
import 'post_list_view_model.dart';

part 'post_list_by_tag_view_model_state.dart';

@injectable
class PostListByTagViewModel
    extends BaseViewModel<PostListByTagViewModelState> {
  PostListByTagViewModel({
    required DoGetPostListByTag doGetPostListByTag,
    required DoCancelGetPostListByTag doCancelGetPostListByTag,
  })  : _doGetPostListByTag = doGetPostListByTag,
        _doCancelGetPostListByTag = doCancelGetPostListByTag,
        super(PostListByTagViewModelState.init());

  final DoGetPostListByTag _doGetPostListByTag;

  final DoCancelGetPostListByTag _doCancelGetPostListByTag;

  Future<void> getPostListByTag({
    required String tag,
    bool isMore = false,
  }) async {
    if (state.isBusy || (isMore && state.isAtEndOfPage)) return;

    final int nextPage = isMore ? state.currentPage + 1 : 0;

    state = state.copyWith(
      status: isMore ? ViewModelStatus.loadingMore : ViewModelStatus.loading,
      isAtEndOfPage: false,
    );

    try {
      final PostListInput input = PostListInput.byTag(
        page: nextPage,
        tag: tag,
      );
      final List<Post> posts = await _doGetPostListByTag(input);
      state = state.copyWith(
        currentPage: nextPage,
        status: ViewModelStatus.loaded,
        posts: isMore ? state.posts + posts : posts,
        isAtEndOfPage: posts.isEmpty,
        currentTag: tag,
      );
    } catch (error, stackTrace) {
      log(
        'An error caught on $runtimeType.',
        name: 'getPostListByTag',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        status: ViewModelStatus.error,
        errorMessage: error.toString(),
      );
    }
  }

  @override
  void dispose() {
    _doCancelGetPostListByTag();
    super.dispose();
  }
}
