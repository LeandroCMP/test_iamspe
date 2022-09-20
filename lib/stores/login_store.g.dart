// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$formLoginAtom =
      Atom(name: '_LoginStoreBase.formLogin', context: context);

  @override
  TextEditingController get formLogin {
    _$formLoginAtom.reportRead();
    return super.formLogin;
  }

  @override
  set formLogin(TextEditingController value) {
    _$formLoginAtom.reportWrite(value, super.formLogin, () {
      super.formLogin = value;
    });
  }

  late final _$formPasswordAtom =
      Atom(name: '_LoginStoreBase.formPassword', context: context);

  @override
  TextEditingController get formPassword {
    _$formPasswordAtom.reportRead();
    return super.formPassword;
  }

  @override
  set formPassword(TextEditingController value) {
    _$formPasswordAtom.reportWrite(value, super.formPassword, () {
      super.formPassword = value;
    });
  }

  late final _$loginSalvoAtom =
      Atom(name: '_LoginStoreBase.loginSalvo', context: context);

  @override
  bool get loginSalvo {
    _$loginSalvoAtom.reportRead();
    return super.loginSalvo;
  }

  @override
  set loginSalvo(bool value) {
    _$loginSalvoAtom.reportWrite(value, super.loginSalvo, () {
      super.loginSalvo = value;
    });
  }

  late final _$loadingLoginAtom =
      Atom(name: '_LoginStoreBase.loadingLogin', context: context);

  @override
  bool get loadingLogin {
    _$loadingLoginAtom.reportRead();
    return super.loadingLogin;
  }

  @override
  set loadingLogin(bool value) {
    _$loadingLoginAtom.reportWrite(value, super.loadingLogin, () {
      super.loadingLogin = value;
    });
  }

  late final _$checkedAtom =
      Atom(name: '_LoginStoreBase.checked', context: context);

  @override
  bool? get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool? value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: '_LoginStoreBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$isAuthenticatingAtom =
      Atom(name: '_LoginStoreBase.isAuthenticating', context: context);

  @override
  bool get isAuthenticating {
    _$isAuthenticatingAtom.reportRead();
    return super.isAuthenticating;
  }

  @override
  set isAuthenticating(bool value) {
    _$isAuthenticatingAtom.reportWrite(value, super.isAuthenticating, () {
      super.isAuthenticating = value;
    });
  }

  late final _$hasBiometricAtom =
      Atom(name: '_LoginStoreBase.hasBiometric', context: context);

  @override
  bool get hasBiometric {
    _$hasBiometricAtom.reportRead();
    return super.hasBiometric;
  }

  @override
  set hasBiometric(bool value) {
    _$hasBiometricAtom.reportWrite(value, super.hasBiometric, () {
      super.hasBiometric = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_LoginStoreBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$loginAtom =
      Atom(name: '_LoginStoreBase.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$versionAtom =
      Atom(name: '_LoginStoreBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$callPageAsyncAction =
      AsyncAction('_LoginStoreBase.callPage', context: context);

  @override
  Future callPage(dynamic context) {
    return _$callPageAsyncAction.run(() => super.callPage(context));
  }

  late final _$checkRememberLoginAsyncAction =
      AsyncAction('_LoginStoreBase.checkRememberLogin', context: context);

  @override
  Future checkRememberLogin(dynamic value) {
    return _$checkRememberLoginAsyncAction
        .run(() => super.checkRememberLogin(value));
  }

  late final _$changeVisibilityAsyncAction =
      AsyncAction('_LoginStoreBase.changeVisibility', context: context);

  @override
  Future changeVisibility() {
    return _$changeVisibilityAsyncAction.run(() => super.changeVisibility());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_LoginStoreBase.logout', context: context);

  @override
  Future logout(dynamic context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  late final _$launchUpdateAsyncAction =
      AsyncAction('_LoginStoreBase.launchUpdate', context: context);

  @override
  Future<void> launchUpdate() {
    return _$launchUpdateAsyncAction.run(() => super.launchUpdate());
  }

  late final _$launchForgotPasswordAsyncAction =
      AsyncAction('_LoginStoreBase.launchForgotPassword', context: context);

  @override
  Future<void> launchForgotPassword() {
    return _$launchForgotPasswordAsyncAction
        .run(() => super.launchForgotPassword());
  }

  late final _$launchFirstAccessAsyncAction =
      AsyncAction('_LoginStoreBase.launchFirstAccess', context: context);

  @override
  Future<void> launchFirstAccess() {
    return _$launchFirstAccessAsyncAction.run(() => super.launchFirstAccess());
  }

  late final _$canUseBiometricAsyncAction =
      AsyncAction('_LoginStoreBase.canUseBiometric', context: context);

  @override
  Future canUseBiometric() {
    return _$canUseBiometricAsyncAction.run(() => super.canUseBiometric());
  }

  late final _$showBiometricAsyncAction =
      AsyncAction('_LoginStoreBase.showBiometric', context: context);

  @override
  Future showBiometric(dynamic context) {
    return _$showBiometricAsyncAction.run(() => super.showBiometric(context));
  }

  late final _$callAuthForButtonAsyncAction =
      AsyncAction('_LoginStoreBase.callAuthForButton', context: context);

  @override
  Future callAuthForButton(dynamic context) {
    return _$callAuthForButtonAsyncAction
        .run(() => super.callAuthForButton(context));
  }

  late final _$getDataAsyncAction =
      AsyncAction('_LoginStoreBase.getData', context: context);

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic passParameters() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.passParameters');
    try {
      return super.passParameters();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formLogin: ${formLogin},
formPassword: ${formPassword},
loginSalvo: ${loginSalvo},
loadingLogin: ${loadingLogin},
checked: ${checked},
obscureText: ${obscureText},
isAuthenticating: ${isAuthenticating},
hasBiometric: ${hasBiometric},
senha: ${senha},
login: ${login},
version: ${version}
    ''';
  }
}
