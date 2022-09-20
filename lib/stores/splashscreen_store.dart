import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'login_store.dart';
part 'splashscreen_store.g.dart';

class SplashScreenStore = _SplashScreenStoreBase with _$SplashScreenStore;

abstract class _SplashScreenStoreBase with Store {
  final loginStore = Modular.get<LoginStore>();
  @action
  loadSplash(context) {
    return Timer(const Duration(seconds: 3), () async {
      loginStore.callPage(context);
    });
  }
}
