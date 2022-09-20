import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsLogin {
  final localAuth = LocalAuthentication();

  Future<bool> auth() async {
    const iosStrings = IOSAuthMessages(
      cancelButton: 'Cancelar',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID',
    );

    const androidStrings = AndroidAuthMessages(
      cancelButton: 'Cancelar',
      goToSettingsButton: 'Settings',
      signInTitle: 'Autenticação necessária',
      biometricHint: '',
      goToSettingsDescription:
          'Por favor, coloque seu dedo sobre o leitor biométrico do dispositivo',
      biometricNotRecognized: 'Biometria não reconhecida',
      biometricSuccess: 'Biometria lida com sucesso!',
    );

    return await localAuth.authenticate(
      localizedReason:
          'Por favor, coloque seu dedo sobre o leitor biométrico do dispositivo para acessar sua conta',
      useErrorDialogs: false,
      iOSAuthStrings: iosStrings,
      androidAuthStrings: androidStrings,
    );
  }

  Future<bool> isBiometricsAuth() => localAuth.canCheckBiometrics;
}
