import 'package:config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'network_module.config.dart';
import 'rest_api/auth_token_provider.dart';
import 'rest_api/rest_client.dart';

@injectableInit
void initNetworkModule(GetIt getIt) => $initGetIt(getIt);

@module
abstract class NetworkModule {
  @singleton
  AuthTokenProvider get provideAuthTokenProvider {
    return AuthTokenProvider.create(authToken: Config.apiSecretKey);
  }

  @singleton
  RESTClient provideRESTClient(AuthTokenProvider authTokenProvider) {
    return RESTClient.withAuthTokenProvider(
      baseUrl: Config.baseUrl,
      authTokenProvider: authTokenProvider,
    );
  }
}
