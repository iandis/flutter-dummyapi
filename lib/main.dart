import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

import 'init_di.dart';

void main() {
  initDI();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dummy API',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: HomeViewRoute.name,
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  final ViewRoute viewRoute = getIt<ViewRoute>(
    instanceName: settings.name,
  );

  return viewRoute(getIt, settings);
}
