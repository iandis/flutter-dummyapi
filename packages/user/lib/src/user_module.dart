
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'user_module.config.dart';

@injectableInit
void initUserModule(GetIt getIt) => $initGetIt(getIt);