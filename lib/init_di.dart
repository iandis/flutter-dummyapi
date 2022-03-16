import 'package:config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:network/network.dart';
import 'package:post/post.dart';
import 'package:user/user.dart';

final GetIt getIt = GetIt.I;

void initDI() {
  initConfigModule(getIt);
  initNetworkModule(getIt);
  initPostModule(getIt);
  initUserModule(getIt);
  initHomeModule(getIt);
}
