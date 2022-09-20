// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_escort_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrEscortStore on _QrEscortStoreBase, Store {
  late final _$escortAtom =
      Atom(name: '_QrEscortStoreBase.escort', context: context);

  @override
  AcompanhanteModel get escort {
    _$escortAtom.reportRead();
    return super.escort;
  }

  @override
  set escort(AcompanhanteModel value) {
    _$escortAtom.reportWrite(value, super.escort, () {
      super.escort = value;
    });
  }

  late final _$setBrightnessAsyncAction =
      AsyncAction('_QrEscortStoreBase.setBrightness', context: context);

  @override
  Future<void> setBrightness() {
    return _$setBrightnessAsyncAction.run(() => super.setBrightness());
  }

  late final _$resetBrightnessAsyncAction =
      AsyncAction('_QrEscortStoreBase.resetBrightness', context: context);

  @override
  Future<void> resetBrightness() {
    return _$resetBrightnessAsyncAction.run(() => super.resetBrightness());
  }

  late final _$_QrEscortStoreBaseActionController =
      ActionController(name: '_QrEscortStoreBase', context: context);

  @override
  dynamic callPage(dynamic context, AcompanhanteModel value) {
    final _$actionInfo = _$_QrEscortStoreBaseActionController.startAction(
        name: '_QrEscortStoreBase.callPage');
    try {
      return super.callPage(context, value);
    } finally {
      _$_QrEscortStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
escort: ${escort}
    ''';
  }
}
