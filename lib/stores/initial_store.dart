import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/views/initial_view.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'initial_store.g.dart';

class InitialStore = _InitialStoreBase with _$InitialStore;

abstract class _InitialStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  @observable
  String? nome;
  @observable
  String? wallet;
  @observable
  bool isLoading = true;
  @observable
  String? data;

  @action
  callPage() async {
    await carregarDado();
    Modular.to.popAndPushNamed('/inicial');
  }

  @action
  Future<bool> isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences.getBool(
          InitialPage.PRIMEIRA_ENTRADA,
        ) ??
        true;
    dev.log("preferences-------------- $isFirstLaunch");
    if (isFirstLaunch) {
      sharedPreferences.setBool(
        InitialPage.PRIMEIRA_ENTRADA,
        false,
      );
    }
    return false;
  }

  @action
  Future<void> carregarDado() async {
    try {
      await loginController.carregarUsuario();
      //nome = Settings.usuario!.nome;
      data = Settings.usuario!.exp;
      await isFirstLaunch();
    } catch (ex) {
      dev.log(
        'Error exception: ',
        error: ex.toString(),
      );
    }
  }
}
