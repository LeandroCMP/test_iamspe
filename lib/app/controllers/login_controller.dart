import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iamspeapp/alerts/alert_login.dart';
import 'package:iamspeapp/app/core/exceptions/auth/auth_failure.dart';
import 'package:iamspeapp/app/repositories/auth/auth_repository.dart';
import 'package:iamspeapp/app/repositories/auth/auth_repository_impl.dart';
import 'package:iamspeapp/app/services/auth_service/auth_service.dart';
import 'package:iamspeapp/app/services/auth_service/auth_service_impl.dart';
import 'package:iamspeapp/config/auth_biometric.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/models/versaoApp.model.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/views/initial_view.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  AlertLogin alertLogin = AlertLogin();
  String passwordController = '';
  String loginController = '';
  bool? checkedToBiometric;
  UsuarioLogadoModel? usuario;

  logout(context) async {
    Modular.to.popAndPushNamed('/login');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
    await prefs.remove('token');
    await prefs.remove('brilho');
    Settings.usuario = null;
    final loginStore = Modular.get<LoginStore>();
    loginStore.loadingLogin = false;
    loginStore.isAuthenticating = false;
  }

  checkHasBiometrics(context) async {
    final biometricsAuth = BiometricsLogin();
    var result;
    if (await biometricsAuth.isBiometricsAuth()) {
      try {
        final auth = await biometricsAuth.auth();
        if (auth) {
          result = await authWithBiometric(context);
        }
      } on PlatformException catch (e) {
        dev.log(
          'Erro ao verificar se há biometria',
          error: e.toString(),
        );
        Modular.to.pop();
      }
    } else {
      return false;
    }
    return result;
  }

  authWithBiometric(context) async {
    if (passwordController.isNotEmpty) {
      authenticateUserValidation(
        context,
        passwordController,
        loginController,
        true,
        true,
      );
    } else {
      final passwordSaved = await getPasswordFromDevice();
      if (passwordSaved != null && passwordSaved.isNotEmpty) {
        authenticateUserValidation(
          context,
          passwordController,
          loginController,
          true,
          true,
        );
        return true;
      } else {
        return alertLogin.showAlertDialog(
          context,
          "Por favor, preencha os campos CPF e Senha!",
        );
      }
    }
  }

  static Future<String?> getPasswordFromDevice() async {
    const _storage = FlutterSecureStorage();
    try {
      const aOptions = AndroidOptions(encryptedSharedPreferences: true);
      const iOptions =
          IOSOptions(accessibility: KeychainAccessibility.first_unlock);
      final password = await _storage.read(
        key: 'password',
        aOptions: aOptions,
        iOptions: iOptions,
      );
      return password!;
    } on PlatformException catch (e) {
      await _storage.deleteAll();
      dev.log(e.toString());
      return null;
    }
  }

  authenticateUserValidation(
    context,
    password,
    login,
    authBiometric,
    withBiometric,
  ) async {
    const storage = FlutterSecureStorage();
    const aOptions = AndroidOptions(encryptedSharedPreferences: true);
    const iOptions =
        IOSOptions(accessibility: KeychainAccessibility.first_unlock);
    final loginSaved = await storage.read(
      key: 'login',
      aOptions: aOptions,
      iOptions: iOptions,
    );
    final passwordSaved = await storage.read(
      key: 'password',
      aOptions: aOptions,
      iOptions: iOptions,
    );
    checkedToBiometric == true
        ? password.isEmpty
            ? password = passwordSaved
            : password
        : password = passwordController;
    login.isEmpty ? login = loginSaved : login;
    withBiometric == true ? password = passwordSaved : password = password;
    if (password.trim().isEmpty || login.trim().isEmpty) {
      return alertLogin.showAlertDialog(
        context,
        'Por favor, preencha os campos CPF e Senha!',
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      authBiometric == true
          ? prefs.setBool('checked', true)
          : prefs.setBool('checked', false);
      final user = await autenticar(
        UsuarioAutenticacaoModel(
          login: login,
          senha: password,
        ),
        authBiometric,
      );
      if (user is EntradaInvalidaModel) {
        return alertLogin.showAlertDialog(
          context,
          'Ocorreu um erro ao realizar o login, tente novamente!',
        );
      } else if (user is UsuarioLogadoModel) {
        final sharedPreferences = await SharedPreferences.getInstance();
        bool isFirstLaunch =
            sharedPreferences.getBool(InitialPage.PRIMEIRA_ENTRADA) ?? true;
        dev.log(
            "---${sharedPreferences.getBool(InitialPage.PRIMEIRA_ENTRADA)}--");
        if (isFirstLaunch) {
          Modular.to.popAndPushNamed('/onboarding_page');
        } else {
          final initialStore = Modular.get<InitialStore>();
          initialStore.callPage();
        }
        return;
      } else {
        return alertLogin.showAlertDialog(
          context,
          user,
        );
      }
    }
  }

  Future<Object?> autenticar(
    UsuarioAutenticacaoModel entrada,
    bool salvar,
  ) async {
    try {
      const _storage = FlutterSecureStorage();
      const aOptions = AndroidOptions(encryptedSharedPreferences: true);
      const iOptions =
          IOSOptions(accessibility: KeychainAccessibility.first_unlock);
      var prefs = await SharedPreferences.getInstance();
      var repository = AuthRepositoryImpl();
      var resposta = await repository.auth(entrada);
      if (resposta is UsuarioTokenModel) {
        final res = resposta as UsuarioTokenModel;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(res.token!);
        var informacoes = await repository.getData(
          decodedToken['login'],
          res.token!,
        );
        if (informacoes != null) {
          usuario = informacoes as UsuarioLogadoModel?;
          usuario!.token = res.token;
          final DateTime now = DateTime.fromMillisecondsSinceEpoch(
            (decodedToken['exp'] * 1000),
          );
          final DateFormat formatter = DateFormat('HH:mm');
          final String formatted = formatter.format(now);
          usuario!.exp = formatted;
          await prefs.setString('usuario', jsonEncode(usuario));
          await prefs.setString('token', res.token!);
          await prefs.setString('salvarUsuario', salvar.toString());
          if (salvar) {
            await _storage.write(
              key: 'login',
              value: entrada.login,
              aOptions: aOptions,
              iOptions: iOptions,
            );
            await _storage.write(
              key: 'password',
              value: entrada.senha,
              aOptions: aOptions,
              iOptions: iOptions,
            );
          } else {
            await _storage.deleteAll();
          }
        }

        return informacoes;
      }

      return resposta;
    } catch (ex) {
      dev.log("erro login:", error: ex.toString());
      usuario = null;
      return null;
    }
  }

  bool tokenExpired(context) {
    if (Settings.usuario != null) {
      bool expirou = JwtDecoder.isExpired(Settings.usuario!.token!);
      if (expirou) {
        alertLogin.showDialogExpiredToken(context);
      }
      return expirou;
    } else {
      carregarUsuario();
      bool expirou = JwtDecoder.isExpired(Settings.usuario!.token!);
      if (expirou) {
        alertLogin.showDialogExpiredToken(context);
      }
      return expirou;
    }
  }

  Future carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioData = prefs.getString('usuario');
    if (usuarioData != null) {
      final resposta = UsuarioLogadoModel.fromJson(jsonDecode(usuarioData));
      Settings.usuario = resposta;
      usuario = resposta;
      final result = usuario!.nome!.split(' ');
      Settings.globalName = '${result[0]} ${result[result.length - 1]}';
    }
  }

  checkVersionPlatform() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Option<AuthFailure>? failure;

  verifyVersion(context) async {
    final AuthRepository authRepository = AuthRepositoryImpl();
    failure = none();
    final AuthService service = AuthServiceImpl(authRepository);
    final response = await service.verifyVersion();
    response.fold((l) {
      failure = optionOf(l);
    }, (r) async {
      failure!.map((fail) {
        String message;
        if (fail is AuthNotFoundFailure) {
          message = "A versão atual do app não pôde ser validada."
              " Registro de versão não encontrado, tente novamente mais tarde!";
        } else {
          message = "Ocorreu um erro ao validar a versão atual"
              " do app, tente novamente mais tarde!";
        }
        alertLogin.showDialogUpdate(context, message: message);
      });
      /*final resultResponse = response.versao!.split('.');
      final checkVersion = await checkVersionPlatform();
      final resultCheckVersion = checkVersion.split('.');
       resultResponse[0] == resultCheckVersion[0]
          ? null
          : alertLogin.showDialogUpdate(context);*/
    });
  }
}
