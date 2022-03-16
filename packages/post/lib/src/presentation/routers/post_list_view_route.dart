import 'package:base/base.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:post/src/presentation/views/post_list_page.dart';
import 'package:provider/provider.dart';

import '../view_models/post_list_view_model.dart';

@Named(PostListViewRoute.name)
@Injectable(as: ViewRoute)
class PostListViewRoute extends DefaultViewRoute {
  static const String name = 'post-list';

  @override
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<PostListViewModel>(
      create: (_) => getIt<PostListViewModel>(),
      child: const PostListPage(),
    );
  }
}
