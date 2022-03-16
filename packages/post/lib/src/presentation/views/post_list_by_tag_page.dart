import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../components/post_list_view.dart';
import '../view_models/post_list_by_tag_view_model.dart';

class PostListByTagPageArguments {
  const PostListByTagPageArguments({
    required this.tag,
  });

  final String tag;
}

class PostListByTagPage extends StatefulWidget {
  const PostListByTagPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final PostListByTagPageArguments args;

  @override
  State<PostListByTagPage> createState() => _PostListByTagPageState();
}

class _PostListByTagPageState extends State<PostListByTagPage> {
  final ScrollController _scrollController = ScrollController();

  late final PostListByTagViewModel _postListByTagViewModel;

  @override
  void initState() {
    super.initState();
    _postListByTagViewModel = context.read<PostListByTagViewModel>()
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
      child: Consumer<PostListByTagViewModel>(
        builder: (_, PostListByTagViewModel viewModel, __) {
          final PostListByTagViewModelState state = viewModel.state;
          final String currentTag =
              state.currentTag.isEmpty ? widget.args.tag : state.currentTag;

          return Scaffold(
            appBar: AppBar(
              title: Text('Posts of $currentTag'),
              actions: state.isLoading
                  ? <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: LoadingIndicator(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ]
                  : null,
            ),
            body: PostListView(
              controller: _scrollController,
              state: state,
              onRefresh: _load,
              onTagPressed: _onTagPressed,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String get _currentTag => _postListByTagViewModel.state.currentTag.isEmpty
      ? widget.args.tag
      : _postListByTagViewModel.state.currentTag;

  Future<void> _load({
    String? tag,
    bool isMore = false,
  }) {
    return _postListByTagViewModel.getPostListByTag(
      tag: tag ?? _currentTag,
      isMore: isMore,
    );
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

  void _onTagPressed(String tag) {
    _load(tag: tag);
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;

    final bool isScrollingDown =
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse;

    final bool isAlmostAtBottom = _scrollController.offset >=
        _scrollController.position.maxScrollExtent * 0.9;

    if (isScrollingDown &&
        isAlmostAtBottom &&
        !_postListByTagViewModel.state.isBusy &&
        !_postListByTagViewModel.state.isAtEndOfPage) {
      _load(isMore: true);
    }
  }

  void _errorListener() {
    if (_postListByTagViewModel.state.hasError) {
      SnackBarUtils.showSnackBar(
        context: context,
        backgroundColor: Colors.red,
        message: _postListByTagViewModel.state.errorMessage!,
      );
    }
  }
}
