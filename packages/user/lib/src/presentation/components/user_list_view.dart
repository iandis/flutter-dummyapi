import 'package:flutter/cupertino.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../../domain/entities/user.dart';
import '../view_models/user_list_by_created_view_model.dart';
import 'user_list_tile.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    Key? key,
    required this.controller,
    required this.state,
    required this.onRefresh,
  }) : super(key: key);

  final ScrollController controller;

  final Future<void> Function() onRefresh;

  final UserListByCreatedViewModelState state;

  @override
  Widget build(BuildContext context) {
    return SliverListView(
      controller: controller,
      canPullToRefresh: !(state.isLoading && state.users.isEmpty),
      onRefresh: onRefresh,
      slivers: <Widget>[
        // -- Loading indicator / Empty lists / Lists
        if (state.isLoading && state.users.isEmpty)
          const SliverFillRemaining(
            child: Center(child: LoadingIndicator()),
          )
        else if (!state.isLoading && state.users.isEmpty)
          SliverFillRemaining(
            child: EmptyResult(
              message: "Oh no, it looks like you haven't created any user :(",
              onRetry: onRefresh,
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                final User user = state.users[index];
                return UserListTile(user: user);
              },
              childCount: state.users.length,
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
                child: Text("No more users for now!"),
              ),
            ),
          ),
      ],
    );
  }
}
