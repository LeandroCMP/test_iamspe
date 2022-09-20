// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletStore on _WalletStoreBase, Store {
  late final _$walletListAtom =
      Atom(name: '_WalletStoreBase.walletList', context: context);

  @override
  List<CarteiraModel>? get walletList {
    _$walletListAtom.reportRead();
    return super.walletList;
  }

  @override
  set walletList(List<CarteiraModel>? value) {
    _$walletListAtom.reportWrite(value, super.walletList, () {
      super.walletList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WalletStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$brightnessAtom =
      Atom(name: '_WalletStoreBase.brightness', context: context);

  @override
  double get brightness {
    _$brightnessAtom.reportRead();
    return super.brightness;
  }

  @override
  set brightness(double value) {
    _$brightnessAtom.reportWrite(value, super.brightness, () {
      super.brightness = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_WalletStoreBase.controller', context: context);

  @override
  AnimationController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(AnimationController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$frontAnimationAtom =
      Atom(name: '_WalletStoreBase.frontAnimation', context: context);

  @override
  Animation<double>? get frontAnimation {
    _$frontAnimationAtom.reportRead();
    return super.frontAnimation;
  }

  @override
  set frontAnimation(Animation<double>? value) {
    _$frontAnimationAtom.reportWrite(value, super.frontAnimation, () {
      super.frontAnimation = value;
    });
  }

  late final _$backAnimationAtom =
      Atom(name: '_WalletStoreBase.backAnimation', context: context);

  @override
  Animation<double>? get backAnimation {
    _$backAnimationAtom.reportRead();
    return super.backAnimation;
  }

  @override
  set backAnimation(Animation<double>? value) {
    _$backAnimationAtom.reportWrite(value, super.backAnimation, () {
      super.backAnimation = value;
    });
  }

  late final _$isFrontVisibleAtom =
      Atom(name: '_WalletStoreBase.isFrontVisible', context: context);

  @override
  bool get isFrontVisible {
    _$isFrontVisibleAtom.reportRead();
    return super.isFrontVisible;
  }

  @override
  set isFrontVisible(bool value) {
    _$isFrontVisibleAtom.reportWrite(value, super.isFrontVisible, () {
      super.isFrontVisible = value;
    });
  }

  late final _$originalBrightnessAtom =
      Atom(name: '_WalletStoreBase.originalBrightness', context: context);

  @override
  double get originalBrightness {
    _$originalBrightnessAtom.reportRead();
    return super.originalBrightness;
  }

  @override
  set originalBrightness(double value) {
    _$originalBrightnessAtom.reportWrite(value, super.originalBrightness, () {
      super.originalBrightness = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_WalletStoreBase.getData', context: context);

  @override
  Future<List<CarteiraModel>?> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$setWalletDataAsyncAction =
      AsyncAction('_WalletStoreBase.setWalletData', context: context);

  @override
  Future setWalletData(String? idHolderParameter,
      String? idBeneficiaryParameter, double brightnessParameter) {
    return _$setWalletDataAsyncAction.run(() => super.setWalletData(
        idHolderParameter, idBeneficiaryParameter, brightnessParameter));
  }

  late final _$_WalletStoreBaseActionController =
      ActionController(name: '_WalletStoreBase', context: context);

  @override
  dynamic callPage(dynamic context) {
    final _$actionInfo = _$_WalletStoreBaseActionController.startAction(
        name: '_WalletStoreBase.callPage');
    try {
      return super.callPage(context);
    } finally {
      _$_WalletStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setupAnimation() {
    final _$actionInfo = _$_WalletStoreBaseActionController.startAction(
        name: '_WalletStoreBase.setupAnimation');
    try {
      return super.setupAnimation();
    } finally {
      _$_WalletStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletList: ${walletList},
isLoading: ${isLoading},
brightness: ${brightness},
controller: ${controller},
frontAnimation: ${frontAnimation},
backAnimation: ${backAnimation},
isFrontVisible: ${isFrontVisible},
originalBrightness: ${originalBrightness}
    ''';
  }
}
