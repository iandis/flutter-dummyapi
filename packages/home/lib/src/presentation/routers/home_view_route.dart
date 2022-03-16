import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../views/home_page.dart';

@Named(HomeViewRoute.name)
@Injectable(as: ViewRoute)
class HomeViewRoute extends DefaultViewRoute {
  static const String name = 'home';

  @override
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  ) {
    return const HomePage();
  }
}
