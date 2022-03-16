// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:base/base.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network/network.dart' as _i4;

import 'data/endpoints/post_list_by_tag_endpoint.dart' as _i3;
import 'data/endpoints/post_list_endpoint.dart' as _i5;
import 'domain/actions/do_cancel_all_post_actions.dart' as _i10;
import 'domain/actions/do_cancel_get_post_list.dart' as _i11;
import 'domain/actions/do_cancel_get_post_list_by_tag.dart' as _i12;
import 'domain/actions/do_get_post_list.dart' as _i13;
import 'domain/actions/do_get_post_list_by_tag.dart' as _i14;
import 'domain/repositories/post_repository.dart' as _i6;
import 'presentation/routers/post_list_by_tag_view_route.dart' as _i9;
import 'presentation/routers/post_list_view_route.dart' as _i8;
import 'presentation/view_models/post_list_by_tag_view_model.dart' as _i15;
import 'presentation/view_models/post_list_view_model.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PostListByTagEndpoint>(
      () => _i3.PostListByTagEndpoint(restClient: get<_i4.RESTClient>()));
  gh.lazySingleton<_i5.PostListEndpoint>(
      () => _i5.PostListEndpoint(restClient: get<_i4.RESTClient>()));
  gh.lazySingleton<_i6.PostRepository>(() => _i6.PostRepository(
      postListEndpoint: get<_i5.PostListEndpoint>(),
      postListByTagEndpoint: get<_i3.PostListByTagEndpoint>()));
  gh.factory<_i7.ViewRoute>(() => _i8.PostListViewRoute(),
      instanceName: 'post-list');
  gh.factory<_i7.ViewRoute>(() => _i9.PostListByTagViewRoute(),
      instanceName: 'post-list-by-tag');
  gh.lazySingleton<_i10.DoCancelAllPostActions>(
      () => _i10.DoCancelAllPostActions(get<_i6.PostRepository>()));
  gh.lazySingleton<_i11.DoCancelGetPostList>(
      () => _i11.DoCancelGetPostList(get<_i6.PostRepository>()));
  gh.lazySingleton<_i12.DoCancelGetPostListByTag>(
      () => _i12.DoCancelGetPostListByTag(get<_i6.PostRepository>()));
  gh.lazySingleton<_i13.DoGetPostList>(
      () => _i13.DoGetPostList(get<_i6.PostRepository>()));
  gh.lazySingleton<_i14.DoGetPostListByTag>(
      () => _i14.DoGetPostListByTag(get<_i6.PostRepository>()));
  gh.factory<_i15.PostListByTagViewModel>(() => _i15.PostListByTagViewModel(
      doGetPostListByTag: get<_i14.DoGetPostListByTag>(),
      doCancelGetPostListByTag: get<_i12.DoCancelGetPostListByTag>()));
  gh.factory<_i16.PostListViewModel>(() => _i16.PostListViewModel(
      doGetPostList: get<_i13.DoGetPostList>(),
      doCancelGetPostList: get<_i11.DoCancelGetPostList>()));
  return get;
}
