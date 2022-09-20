// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_declaration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaxDeclarationStore on _TaxDeclarationStoreBase, Store {
  late final _$resultAtom =
      Atom(name: '_TaxDeclarationStoreBase.result', context: context);

  @override
  DeclaracaoRendaModel? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(DeclaracaoRendaModel? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_TaxDeclarationStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_TaxDeclarationStoreBase.usuario', context: context);

  @override
  UsuarioLogadoModel? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UsuarioLogadoModel? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$listaDeclaracoesAtom =
      Atom(name: '_TaxDeclarationStoreBase.listaDeclaracoes', context: context);

  @override
  List<DeclaracaoRendaModel>? get listaDeclaracoes {
    _$listaDeclaracoesAtom.reportRead();
    return super.listaDeclaracoes;
  }

  @override
  set listaDeclaracoes(List<DeclaracaoRendaModel>? value) {
    _$listaDeclaracoesAtom.reportWrite(value, super.listaDeclaracoes, () {
      super.listaDeclaracoes = value;
    });
  }

  late final _$sortAtom =
      Atom(name: '_TaxDeclarationStoreBase.sort', context: context);

  @override
  bool? get sort {
    _$sortAtom.reportRead();
    return super.sort;
  }

  @override
  set sort(bool? value) {
    _$sortAtom.reportWrite(value, super.sort, () {
      super.sort = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaxDeclarationStoreBase.isLoading', context: context);

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

  late final _$callPageAsyncAction =
      AsyncAction('_TaxDeclarationStoreBase.callPage', context: context);

  @override
  Future callPage(dynamic context) {
    return _$callPageAsyncAction.run(() => super.callPage(context));
  }

  late final _$callPageDeclarationListAsyncAction = AsyncAction(
      '_TaxDeclarationStoreBase.callPageDeclarationList',
      context: context);

  @override
  Future callPageDeclarationList(dynamic context) {
    return _$callPageDeclarationListAsyncAction
        .run(() => super.callPageDeclarationList(context));
  }

  @override
  String toString() {
    return '''
result: ${result},
loading: ${loading},
usuario: ${usuario},
listaDeclaracoes: ${listaDeclaracoes},
sort: ${sort},
isLoading: ${isLoading}
    ''';
  }
}
