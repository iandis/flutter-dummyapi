import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

abstract class ViewRoute {
  Route<dynamic> call(GetIt getIt, RouteSettings settings);
}

abstract class DefaultViewRoute extends ViewRoute {
  Widget builder(
    BuildContext context,
    GetIt getIt,
    RouteSettings settings,
  );

  @override
  Route<dynamic> call(GetIt getIt, RouteSettings settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder(context, getIt, settings),
    );
  }
}
