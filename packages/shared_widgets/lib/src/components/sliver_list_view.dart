import 'package:flutter/cupertino.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({
    Key? key,
    this.controller,
    this.topPadding = 0,
    this.bottomPadding = 10,
    required this.canPullToRefresh,
    required this.onRefresh,
    this.slivers = const <Widget>[],
  }) : super(key: key);

  final ScrollController? controller;

  final double topPadding;

  final double bottomPadding;

  final bool canPullToRefresh;

  final Future<void> Function() onRefresh;

  final List<Widget> slivers;

  Widget get _pullToRefreshOrEmpty {
    if (canPullToRefresh) {
      return CupertinoSliverRefreshControl(onRefresh: onRefresh);
    }

    return const SliverToBoxAdapter();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        _pullToRefreshOrEmpty,
        SliverToBoxAdapter(child: SizedBox(height: topPadding)),
        ...slivers,
        SliverToBoxAdapter(child: SizedBox(height: bottomPadding)),
      ],
    );
  }
}
