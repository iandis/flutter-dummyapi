import 'package:base/base.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../view_models/user_list_by_created_view_model.dart';
import '../views/user_list_by_created_page.dart';

@Named(UserListByCreatedViewRoute.name)
@Injectable(as: ViewRoute)
class UserListByCreatedViewRoute extends DefaultViewRoute {
  static const String name = 'user-list-by-created';

  @override
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<UserListByCreatedViewModel>(
      create: (_) => getIt<UserListByCreatedViewModel>(),
      child: const UserListByCreatedPage(),
    );
  }
}
