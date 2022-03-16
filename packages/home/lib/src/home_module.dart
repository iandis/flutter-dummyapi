import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'home_module.config.dart';

@injectableInit
void initHomeModule(GetIt getIt) => $initGetIt(getIt);
