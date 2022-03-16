import 'package:flutter/cupertino.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../domain/entities/post.dart';
import '../view_models/post_list_view_model.dart';
import 'post_item.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
    required this.controller,
    required this.state,
    required this.onRefresh,
    required this.onTagPressed,
  }) : super(key: key);

  final ScrollController controller;

  final Future<void> Function() onRefresh;

  final void Function(String tag)? onTagPressed;

  final PostListViewModelState state;

  @override
  Widget build(BuildContext context) {
    const Widget separator = SliverToBoxAdapter(child: SizedBox(height: 10));

    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // -- Refresh indicator
        if (!(state.isLoading && state.posts.isEmpty))
          CupertinoSliverRefreshControl(onRefresh: onRefresh)
        else
          const SliverToBoxAdapter(),

        // -- Loading indicator / Empty lists / Lists
        if (state.isLoading && state.posts.isEmpty)
          const SliverFillRemaining(
            child: Center(child: LoadingIndicator()),
          )
        else if (!state.isLoading && state.posts.isEmpty)
          SliverFillRemaining(
            child: EmptyResult(
              message: "There's no post at the moment :(",
              onRetry: onRefresh,
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                final Post post = state.posts[index];
                return PostItem(
                  post: post,
                  onTagPressed: onTagPressed,
                );
              },
              childCount: state.posts.length,
            ),
          ),
        // -- Bottom loading indicator
        if (state.isLoadingMore)
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
              child: Center(child: LoadingIndicator()),
            ),
          )
        else if (state.isAtEndOfPage)
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
              child: Center(
                child: Text("That's all for now!"),
              ),
            ),
          ),
        separator,
      ],
    );
  }
}
