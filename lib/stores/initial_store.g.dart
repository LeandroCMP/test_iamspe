// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitialStore on _InitialStoreBase, Store {
  late final _$nomeAtom =
      Atom(name: '_InitialStoreBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$walletAtom =
      Atom(name: '_InitialStoreBase.wallet', context: context);

  @override
  String? get wallet {
    _$walletAtom.reportRead();
    return super.wallet;
  }

  @override
  set wallet(String? value) {
    _$walletAtom.reportWrite(value, super.wallet, () {
      super.wallet = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_InitialStoreBase.isLoading', context: context);

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

  late final _$dataAtom =
      Atom(name: '_InitialStoreBase.data', context: context);

  @override
  String? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$callPageAsyncAction =
      AsyncAction('_InitialStoreBase.callPage', context: context);

  @override
  Future callPage() {
    return _$callPageAsyncAction.run(() => super.callPage());
  }

  late final _$isFirstLaunchAsyncAction =
      AsyncAction('_InitialStoreBase.isFirstLaunch', context: context);

  @override
  Future<bool> isFirstLaunch() {
    return _$isFirstLaunchAsyncAction.run(() => super.isFirstLaunch());
  }

  late final _$carregarDadoAsyncAction =
      AsyncAction('_InitialStoreBase.carregarDado', context: context);

  @override
  Future<void> carregarDado() {
    return _$carregarDadoAsyncAction.run(() => super.carregarDado());
  }

  @override
  String toString() {
    return '''
nome: ${nome},
wallet: ${wallet},
isLoading: ${isLoading},
data: ${data}
    ''';
  }
}
