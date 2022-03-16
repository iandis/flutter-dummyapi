import 'package:config/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:post/src/domain/actions/_actions.dart';
import 'package:post/src/post_module.dart';

import 'actions_test.config.dart';
import 'do_get_post_list.test.dart';
import 'do_get_post_list_by_tag.test.dart';

void main() {
  final GetIt getItForTest = GetIt.asNewInstance();
  initPostTestModule(getItForTest);
  initNetworkModule(getItForTest);
  initPostModule(getItForTest);
  group('Test Post Repository Actions:', () {
    testDoGetPostList(getItForTest<DoGetPostList>());
    testDoGetPostListByTag(getItForTest<DoGetPostListByTag>());
  });
}

@InjectableInit(generateForDir: <String>['test'])
void initPostTestModule(GetIt getIt) => $initGetIt(getIt);

@module
abstract class PostTestModule {
  @singleton
  Config get provideTestConfig {
    return const Config(
      baseUrl: 'BASE_URL',
      apiSecretKey: 'API_SECRET_KEY',
    );
  }
}
