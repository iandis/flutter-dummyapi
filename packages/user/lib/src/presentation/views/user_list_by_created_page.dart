import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:user/src/presentation/components/user_list_view.dart';

import '../routers/user_create_view_route.dart';
import '../view_models/user_list_by_created_view_model.dart';

class UserListByCreatedPage extends StatefulWidget {
  const UserListByCreatedPage({Key? key}) : super(key: key);

  @override
  State<UserListByCreatedPage> createState() => _UserListByCreatedPageState();
}

class _UserListByCreatedPageState extends State<UserListByCreatedPage> {
  final ScrollController _scrollController = ScrollController();

  late final UserListByCreatedViewModel _userListByCreatedViewModel;

  @override
  void initState() {
    super.initState();
    _userListByCreatedViewModel = context.read<UserListByCreatedViewModel>()
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
          title: const Text('Users'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _navigateToCreateUser,
            ),
          ],
        ),
        body: Consumer<UserListByCreatedViewModel>(
          builder: (_, UserListByCreatedViewModel viewModel, __) {
            return UserListView(
              controller: _scrollController,
              state: viewModel.state,
              onRefresh: _load,
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
    return _userListByCreatedViewModel.getUserList(isMore: isMore);
  }

  Future<void> _navigateToCreateUser() async {
    final dynamic isSuccess = await Navigator.of(context).pushNamed(
      UserCreateViewRoute.name,
    );

    if (isSuccess is bool && isSuccess) {
      _load();
    }
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
        _userListByCreatedViewModel.state.isBusy ||
        _userListByCreatedViewModel.state.isAtEndOfPage) {
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

  void _errorListener() {
    if (_userListByCreatedViewModel.state.hasError) {
      SnackBarUtils.showSnackBar(
        context: context,
        backgroundColor: Colors.red,
        message: _userListByCreatedViewModel.state.errorMessage!,
      );
    }
  }
}
