import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../components/post_list_view.dart';
import '../routers/post_list_by_tag_view_route.dart';
import '../view_models/post_list_view_model.dart';
import 'post_list_by_tag_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final ScrollController _scrollController = ScrollController();

  late final PostListViewModel _postListViewModel;

  @override
  void initState() {
    super.initState();
    _postListViewModel = context.read<PostListViewModel>()
      ..addListener(_errorListener);
    _scrollController.addListener(_scrollListener);
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Consumer<PostListViewModel>(
          builder: (_, PostListViewModel viewModel, __) {
            final PostListViewModelState state = viewModel.state;

            return PostListView(
              controller: _scrollController,
              state: state,
              onRefresh: _load,
              onTagPressed: _onTagPressed,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load({
    bool isMore = false,
  }) {
    return _postListViewModel.getPostList(isMore: isMore);
  }

  Future<bool> _onBackPressed() async {
    if (!_scrollController.hasClients) return true;

    if (_scrollController.offset > 100) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      return false;
    }

    return true;
  }

  void _scrollListener() {
    if (!_scrollController.hasClients ||
        _postListViewModel.state.isBusy ||
        _postListViewModel.state.isAtEndOfPage) {
      return;
    }

    final bool isScrollingDown =
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse;

    final bool isAlmostAtBottom = _scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.95;

    if (isScrollingDown && isAlmostAtBottom) {
      _load(isMore: true);
    }
  }

  void _onTagPressed(String tag) {
    Navigator.of(context).pushNamed(
      PostListByTagViewRoute.name,
      arguments: PostListByTagPageArguments(tag: tag),
    );
  }

  void _errorListener() {
    if (_postListViewModel.state.hasError) {
      SnackBarUtils.showSnackBar(
        context: context,
        backgroundColor: Colors.red,
        message: _postListViewModel.state.errorMessage!,
      );
    }
  }
}
