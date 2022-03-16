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
    return Config(
      baseUrl: 'https://dummyapi.io/data/v1',
      apiSecretKey: throw UnimplementedError('Please provide your app-id'),
    );
  }
}
