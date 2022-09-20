import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final auth = LocalAuthentication();
  @observable
  TextEditingController formLogin = TextEditingController();

  @observable
  TextEditingController formPassword = TextEditingController();

  @observable
  bool loginSalvo = false;

  @observable
  bool loadingLogin = false;

  @observable
  bool? checked = false;

  @observable
  bool obscureText = true;

  @observable
  bool isAuthenticating = false;

  @observable
  bool hasBiometric = false;

  @observable
  String senha = '';

  @observable
  String login = '';

  @observable
  String version = '';

  @action
  callPage(context) async {
    canUseBiometric();
    loadingLogin = false;
    getData();
    final result = await loginController.checkVersionPlatform();
    version = result.toString();
    Modular.to.popAndPushNamed('/login');
    await loginController.verifyVersion(context);
  }

  @action
  checkRememberLogin(value) async {
    checked = value;
  }

  @action
  changeVisibility() async {
    obscureText = !obscureText;
  }

  @action
  logout(context) async {
    final prefs = await SharedPreferences.getInstance();
    final isChecked = prefs.getBool('checked');
    isChecked == false ? checked = false : checked = true;
    loadingLogin = false;
    if (isChecked == false) {
      checked = false;
      formLogin.clear();
    } else {
      checked = true;
    }
    formPassword.clear();
    await loginController.logout(context);
  }

  @action
  Future<void> launchUpdate() async {
    final Uri url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.br.iamspe.appbeneficiario',
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    throw 'Could not launch $url';
  }

  @action
  Future<void> launchForgotPassword() async {
    final Uri url = Uri.parse(
      'http://app.iamspe.sp.gov.br/frontline/esqueci-a-senha',
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    throw 'Could not launch $url';
  }

  @action
  Future<void> launchFirstAccess() async {
    final Uri url = Uri.parse(
      'http://app.iamspe.sp.gov.br/frontline/primeiro-acesso-portal-beneficiario',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    throw 'Could not launch $url';
  }

  @action
  canUseBiometric() async {
    final isSupported = await auth.isDeviceSupported();
    if (isSupported == true) {
      final prefs = await SharedPreferences.getInstance();
      final isChecked = prefs.getBool('checked');
      if (isChecked == true) {
        hasBiometric = true;
      } else if (isChecked == false || isChecked == null) {
        hasBiometric = false;
      }
    } else {
      hasBiometric = false;
    }
  }

  @action
  passParameters() {
    loginController.loginController = formLogin.text;
    loginController.passwordController = formPassword.text;
  }

  @action
  showBiometric(context) async {
    if (checked!) {
      passParameters();
      final result = await loginController.checkHasBiometrics(context);
      result == true ? loadingLogin = true : loadingLogin = false;
      dev.log(hasBiometric.toString());
    } else {
      return false;
    }
  }

  @action
  callAuthForButton(context) async {
    loadingLogin = true;
    await passParameters();
    if (checked == true) {
      hasBiometric = true;
      await loginController.authenticateUserValidation(
        context,
        formPassword.text,
        formLogin.text,
        true,
        false,
      );
    } else {
      await loginController.authenticateUserValidation(
        context,
        formPassword.text,
        formLogin.text,
        false,
        false,
      );
    }
    loadingLogin = false;
  }

  @action
  Future getData() async {
    try {
      const _storage = FlutterSecureStorage();
      const aOptions = AndroidOptions(encryptedSharedPreferences: true);
      const iOptions =
          IOSOptions(accessibility: KeychainAccessibility.first_unlock);
      final prefs = await SharedPreferences.getInstance();
      final login = await _storage.read(
          key: 'login', aOptions: aOptions, iOptions: iOptions);
      checked = prefs.getString('salvarUsuario') == "true" ? true : false;
      formLogin.text = login!;
      final senha = await _storage.read(
        key: 'password',
        aOptions: aOptions,
        iOptions: iOptions,
      );
      if (formPassword.text.isNotEmpty && senha!.isNotEmpty) {
        loginSalvo = true;
      } else {
        loginSalvo = false;
      }
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados na store',
        error: ex.toString(),
      );
    }
  }
}
