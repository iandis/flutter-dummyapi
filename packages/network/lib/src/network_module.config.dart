// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:config/config.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'network_module.dart' as _i6;
import 'rest_api/rest_client.dart' as _i5;
import 'rest_api/secret_key_provider.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.SecretKeyProvider>(
      networkModule.provideSecretKeyProvider(get<_i4.Config>()));
  gh.singleton<_i5.RESTClient>(networkModule.provideRESTClient(
      get<_i4.Config>(), get<_i3.SecretKeyProvider>()));
  return get;
}

class _$NetworkModule extends _i6.NetworkModule {}
