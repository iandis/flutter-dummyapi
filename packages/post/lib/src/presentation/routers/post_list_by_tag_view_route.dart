import 'package:base/base.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../view_models/post_list_by_tag_view_model.dart';
import '../views/post_list_by_tag_page.dart';

@Named(PostListByTagViewRoute.name)
@Injectable(as: ViewRoute)
class PostListByTagViewRoute extends DefaultViewRoute {
  static const String name = 'post-list-by-tag';

  @override
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  ) {
    final Object? arguments = settings.arguments;

    if (arguments is! PostListByTagPageArguments) {
      throw ArgumentError.value(
        arguments,
        'settings.arguments',
        'Argument should be an instance of [PostListByTagPageArguments]',
      );
    }

    return ChangeNotifierProvider<PostListByTagViewModel>(
      create: (_) => getIt<PostListByTagViewModel>(),
      child: PostListByTagPage(args: arguments),
    );
  }
}
