import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'post_module.config.dart';

@injectableInit
void initPostModule(GetIt getIt) => $initGetIt(getIt);
