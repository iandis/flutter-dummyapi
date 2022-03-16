import 'package:base/base.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../view_models/user_create_view_model.dart';
import '../views/user_create_page.dart';

@Named(UserCreateViewRoute.name)
@Injectable(as: ViewRoute)
class UserCreateViewRoute extends DefaultViewRoute {
  static const String name = 'user-create';

  @override
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<UserCreateViewModel>(
      create: (_) => getIt<UserCreateViewModel>(),
      child: const UserCreatePage(),
    );
  }
}
