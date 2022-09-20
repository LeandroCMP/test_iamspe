// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declaration_schedule_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeclarationScheduleListStore
    on _DeclarationScheduleListStoreBase, Store {
  late final _$usuarioAtom =
      Atom(name: '_DeclarationScheduleListStoreBase.usuario', context: context);

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

  late final _$listaDeclaracoesAtom = Atom(
      name: '_DeclarationScheduleListStoreBase.listaDeclaracoes',
      context: context);

  @override
  List<DeclaracaoComparecimentoModel> get listaDeclaracoes {
    _$listaDeclaracoesAtom.reportRead();
    return super.listaDeclaracoes;
  }

  @override
  set listaDeclaracoes(List<DeclaracaoComparecimentoModel> value) {
    _$listaDeclaracoesAtom.reportWrite(value, super.listaDeclaracoes, () {
      super.listaDeclaracoes = value;
    });
  }

  late final _$isLoadingAtom = Atom(
      name: '_DeclarationScheduleListStoreBase.isLoading', context: context);

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

  late final _$generatedPdfFilePathAtom = Atom(
      name: '_DeclarationScheduleListStoreBase.generatedPdfFilePath',
      context: context);

  @override
  String? get generatedPdfFilePath {
    _$generatedPdfFilePathAtom.reportRead();
    return super.generatedPdfFilePath;
  }

  @override
  set generatedPdfFilePath(String? value) {
    _$generatedPdfFilePathAtom.reportWrite(value, super.generatedPdfFilePath,
        () {
      super.generatedPdfFilePath = value;
    });
  }

  late final _$testeAtom =
      Atom(name: '_DeclarationScheduleListStoreBase.teste', context: context);

  @override
  String get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(String value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  late final _$ePacienteAtom = Atom(
      name: '_DeclarationScheduleListStoreBase.ePaciente', context: context);

  @override
  bool get ePaciente {
    _$ePacienteAtom.reportRead();
    return super.ePaciente;
  }

  @override
  set ePaciente(bool value) {
    _$ePacienteAtom.reportWrite(value, super.ePaciente, () {
      super.ePaciente = value;
    });
  }

  late final _$callPageAsyncAction = AsyncAction(
      '_DeclarationScheduleListStoreBase.callPage',
      context: context);

  @override
  Future callPage(dynamic context) {
    return _$callPageAsyncAction.run(() => super.callPage(context));
  }

  late final _$carregarDadosAsyncAction = AsyncAction(
      '_DeclarationScheduleListStoreBase.carregarDados',
      context: context);

  @override
  Future carregarDados() {
    return _$carregarDadosAsyncAction.run(() => super.carregarDados());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
listaDeclaracoes: ${listaDeclaracoes},
isLoading: ${isLoading},
generatedPdfFilePath: ${generatedPdfFilePath},
teste: ${teste},
ePaciente: ${ePaciente}
    ''';
  }
}
