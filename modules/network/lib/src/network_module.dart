import 'package:config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'network_module.config.dart';
import 'rest_api/secret_key_provider.dart';
import 'rest_api/rest_client.dart';

@injectableInit
void initNetworkModule(GetIt getIt) => $initGetIt(getIt);

@module
abstract class NetworkModule {
  @singleton
  SecretKeyProvider get provideSecretKeyProvider {
    return SecretKeyProvider.create(secretKey: Config.apiSecretKey);
  }

  @singleton
  RESTClient provideRESTClient(SecretKeyProvider secretKeyProvider) {
    return RESTClient.withSecretKeyProvider(
      baseUrl: Config.baseUrl,
      secretKeyProvider: secretKeyProvider,
    );
  }
}
