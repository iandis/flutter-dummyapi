// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:base/base.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network/network.dart' as _i4;

import 'data/endpoints/user_create_endpoint.dart' as _i3;
import 'data/endpoints/user_list_by_created_endpoint.dart' as _i5;
import 'domain/actions/do_cancel_create_user.dart' as _i10;
import 'domain/actions/do_cancel_get_user_list_by_created.dart' as _i11;
import 'domain/actions/do_create_user.dart' as _i12;
import 'domain/actions/do_get_user_list_by_created.dart' as _i13;
import 'domain/repositories/user_repository.dart' as _i6;
import 'presentation/routers/user_create_view_route.dart' as _i9;
import 'presentation/routers/user_list_by_created_view_route.dart' as _i8;
import 'presentation/view_models/user_create_view_model.dart' as _i14;
import 'presentation/view_models/user_list_by_created_view_model.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.UserCreateEndpoint>(
      () => _i3.UserCreateEndpoint(restClient: get<_i4.RESTClient>()));
  gh.lazySingleton<_i5.UserListByCreatedEndpoint>(
      () => _i5.UserListByCreatedEndpoint(restClient: get<_i4.RESTClient>()));
  gh.lazySingleton<_i6.UserRepository>(() => _i6.UserRepository(
      userCreateEndpoint: get<_i3.UserCreateEndpoint>(),
      userListByCreatedEndpoint: get<_i5.UserListByCreatedEndpoint>()));
  gh.factory<_i7.ViewRoute>(() => _i8.UserListByCreatedViewRoute(),
      instanceName: 'user-list-by-created');
  gh.factory<_i7.ViewRoute>(() => _i9.UserCreateViewRoute(),
      instanceName: 'user-create');
  gh.lazySingleton<_i10.DoCancelCreateUser>(
      () => _i10.DoCancelCreateUser(get<_i6.UserRepository>()));
  gh.lazySingleton<_i11.DoCancelGetUserListByCreated>(
      () => _i11.DoCancelGetUserListByCreated(get<_i6.UserRepository>()));
  gh.lazySingleton<_i12.DoCreateUser>(
      () => _i12.DoCreateUser(get<_i6.UserRepository>()));
  gh.lazySingleton<_i13.DoGetUserListByCreated>(
      () => _i13.DoGetUserListByCreated(get<_i6.UserRepository>()));
  gh.factory<_i14.UserCreateViewModel>(() => _i14.UserCreateViewModel(
      doCreateUser: get<_i12.DoCreateUser>(),
      doCancelCreateUser: get<_i10.DoCancelCreateUser>()));
  gh.factory<_i15.UserListByCreatedViewModel>(() =>
      _i15.UserListByCreatedViewModel(
          doGetUserListByCreated: get<_i13.DoGetUserListByCreated>(),
          doCancelGetUserListByCreated:
              get<_i11.DoCancelGetUserListByCreated>()));
  return get;
}
