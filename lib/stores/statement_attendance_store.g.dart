// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_attendance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatementAttendanceStore on _StatementAttendanceStoreBase, Store {
  late final _$generatedPdfFilePathAtom = Atom(
      name: '_StatementAttendanceStoreBase.generatedPdfFilePath',
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

  late final _$ePacienteAtom =
      Atom(name: '_StatementAttendanceStoreBase.ePaciente', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_StatementAttendanceStoreBase.isLoading', context: context);

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

  late final _$docAtom =
      Atom(name: '_StatementAttendanceStoreBase.doc', context: context);

  @override
  PDFDocument? get doc {
    _$docAtom.reportRead();
    return super.doc;
  }

  @override
  set doc(PDFDocument? value) {
    _$docAtom.reportWrite(value, super.doc, () {
      super.doc = value;
    });
  }

  late final _$pacienteAtom =
      Atom(name: '_StatementAttendanceStoreBase.paciente', context: context);

  @override
  bool get paciente {
    _$pacienteAtom.reportRead();
    return super.paciente;
  }

  @override
  set paciente(bool value) {
    _$pacienteAtom.reportWrite(value, super.paciente, () {
      super.paciente = value;
    });
  }

  late final _$declaracaoResultAtom = Atom(
      name: '_StatementAttendanceStoreBase.declaracaoResult', context: context);

  @override
  DeclaracaoComparecimentoModel? get declaracaoResult {
    _$declaracaoResultAtom.reportRead();
    return super.declaracaoResult;
  }

  @override
  set declaracaoResult(DeclaracaoComparecimentoModel? value) {
    _$declaracaoResultAtom.reportWrite(value, super.declaracaoResult, () {
      super.declaracaoResult = value;
    });
  }

  late final _$callPageAsyncAction =
      AsyncAction('_StatementAttendanceStoreBase.callPage', context: context);

  @override
  Future callPage(dynamic paciente, dynamic declaracao) {
    return _$callPageAsyncAction
        .run(() => super.callPage(paciente, declaracao));
  }

  late final _$carregarPdfAsyncAction = AsyncAction(
      '_StatementAttendanceStoreBase.carregarPdf',
      context: context);

  @override
  Future carregarPdf() {
    return _$carregarPdfAsyncAction.run(() => super.carregarPdf());
  }

  @override
  String toString() {
    return '''
generatedPdfFilePath: ${generatedPdfFilePath},
ePaciente: ${ePaciente},
isLoading: ${isLoading},
doc: ${doc},
paciente: ${paciente},
declaracaoResult: ${declaracaoResult}
    ''';
  }
}
