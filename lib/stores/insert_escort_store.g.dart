// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_escort_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InsertEscortStore on _InsertEscortStoreBase, Store {
  late final _$acompanhanteAtom =
      Atom(name: '_InsertEscortStoreBase.acompanhante', context: context);

  @override
  AcompanhanteModel? get acompanhante {
    _$acompanhanteAtom.reportRead();
    return super.acompanhante;
  }

  @override
  set acompanhante(AcompanhanteModel? value) {
    _$acompanhanteAtom.reportWrite(value, super.acompanhante, () {
      super.acompanhante = value;
    });
  }

  late final _$agregadoPageAtom =
      Atom(name: '_InsertEscortStoreBase.agregadoPage', context: context);

  @override
  bool? get agregadoPage {
    _$agregadoPageAtom.reportRead();
    return super.agregadoPage;
  }

  @override
  set agregadoPage(bool? value) {
    _$agregadoPageAtom.reportWrite(value, super.agregadoPage, () {
      super.agregadoPage = value;
    });
  }

  late final _$cpfAgregadoAtom =
      Atom(name: '_InsertEscortStoreBase.cpfAgregado', context: context);

  @override
  String? get cpfAgregado {
    _$cpfAgregadoAtom.reportRead();
    return super.cpfAgregado;
  }

  @override
  set cpfAgregado(String? value) {
    _$cpfAgregadoAtom.reportWrite(value, super.cpfAgregado, () {
      super.cpfAgregado = value;
    });
  }

  late final _$nomeAgregadoAtom =
      Atom(name: '_InsertEscortStoreBase.nomeAgregado', context: context);

  @override
  String? get nomeAgregado {
    _$nomeAgregadoAtom.reportRead();
    return super.nomeAgregado;
  }

  @override
  set nomeAgregado(String? value) {
    _$nomeAgregadoAtom.reportWrite(value, super.nomeAgregado, () {
      super.nomeAgregado = value;
    });
  }

  late final _$prontuarioAtom =
      Atom(name: '_InsertEscortStoreBase.prontuario', context: context);

  @override
  int? get prontuario {
    _$prontuarioAtom.reportRead();
    return super.prontuario;
  }

  @override
  set prontuario(int? value) {
    _$prontuarioAtom.reportWrite(value, super.prontuario, () {
      super.prontuario = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_InsertEscortStoreBase.usuario', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_InsertEscortStoreBase.isLoading', context: context);

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

  late final _$loadingRequestAtom =
      Atom(name: '_InsertEscortStoreBase.loadingRequest', context: context);

  @override
  bool get loadingRequest {
    _$loadingRequestAtom.reportRead();
    return super.loadingRequest;
  }

  @override
  set loadingRequest(bool value) {
    _$loadingRequestAtom.reportWrite(value, super.loadingRequest, () {
      super.loadingRequest = value;
    });
  }

  late final _$nomectrlAtom =
      Atom(name: '_InsertEscortStoreBase.nomectrl', context: context);

  @override
  TextEditingController get nomectrl {
    _$nomectrlAtom.reportRead();
    return super.nomectrl;
  }

  @override
  set nomectrl(TextEditingController value) {
    _$nomectrlAtom.reportWrite(value, super.nomectrl, () {
      super.nomectrl = value;
    });
  }

  late final _$cpfctrlAtom =
      Atom(name: '_InsertEscortStoreBase.cpfctrl', context: context);

  @override
  TextEditingController get cpfctrl {
    _$cpfctrlAtom.reportRead();
    return super.cpfctrl;
  }

  @override
  set cpfctrl(TextEditingController value) {
    _$cpfctrlAtom.reportWrite(value, super.cpfctrl, () {
      super.cpfctrl = value;
    });
  }

  late final _$emailctrlAtom =
      Atom(name: '_InsertEscortStoreBase.emailctrl', context: context);

  @override
  TextEditingController get emailctrl {
    _$emailctrlAtom.reportRead();
    return super.emailctrl;
  }

  @override
  set emailctrl(TextEditingController value) {
    _$emailctrlAtom.reportWrite(value, super.emailctrl, () {
      super.emailctrl = value;
    });
  }

  late final _$maskFormatterAtom =
      Atom(name: '_InsertEscortStoreBase.maskFormatter', context: context);

  @override
  MaskTextInputFormatter get maskFormatter {
    _$maskFormatterAtom.reportRead();
    return super.maskFormatter;
  }

  @override
  set maskFormatter(MaskTextInputFormatter value) {
    _$maskFormatterAtom.reportWrite(value, super.maskFormatter, () {
      super.maskFormatter = value;
    });
  }

  late final _$cadastrarAcompanhanteAsyncAction = AsyncAction(
      '_InsertEscortStoreBase.cadastrarAcompanhante',
      context: context);

  @override
  Future<void> cadastrarAcompanhante(dynamic context) {
    return _$cadastrarAcompanhanteAsyncAction
        .run(() => super.cadastrarAcompanhante(context));
  }

  late final _$_InsertEscortStoreBaseActionController =
      ActionController(name: '_InsertEscortStoreBase', context: context);

  @override
  dynamic callPage(dynamic context,
      {AcompanhanteModel? escort,
      dynamic accredited,
      dynamic cpf,
      dynamic name,
      dynamic chart}) {
    final _$actionInfo = _$_InsertEscortStoreBaseActionController.startAction(
        name: '_InsertEscortStoreBase.callPage');
    try {
      return super.callPage(context,
          escort: escort,
          accredited: accredited,
          cpf: cpf,
          name: name,
          chart: chart);
    } finally {
      _$_InsertEscortStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData() {
    final _$actionInfo = _$_InsertEscortStoreBaseActionController.startAction(
        name: '_InsertEscortStoreBase.getData');
    try {
      return super.getData();
    } finally {
      _$_InsertEscortStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
acompanhante: ${acompanhante},
agregadoPage: ${agregadoPage},
cpfAgregado: ${cpfAgregado},
nomeAgregado: ${nomeAgregado},
prontuario: ${prontuario},
usuario: ${usuario},
isLoading: ${isLoading},
loadingRequest: ${loadingRequest},
nomectrl: ${nomectrl},
cpfctrl: ${cpfctrl},
emailctrl: ${emailctrl},
maskFormatter: ${maskFormatter}
    ''';
  }
}
