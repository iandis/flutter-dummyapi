import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'config.dart';
import 'config_module.config.dart';

@injectableInit
void initConfigModule(GetIt getIt) => $initGetIt(getIt);

@module
abstract class ConfigModule {
  @singleton
  Config get provideConfig {
    return const Config(
      baseUrl: 'BASE_URL',
      apiSecretKey: 'API_SECRET_KEY',
    );
  }
}
