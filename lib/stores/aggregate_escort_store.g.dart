// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregate_escort_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AggregateEscortStore on _AggregateEscortStoreBase, Store {
  late final _$cpfAcompanhanteAtom =
      Atom(name: '_AggregateEscortStoreBase.cpfAcompanhante', context: context);

  @override
  String? get cpfAcompanhante {
    _$cpfAcompanhanteAtom.reportRead();
    return super.cpfAcompanhante;
  }

  @override
  set cpfAcompanhante(String? value) {
    _$cpfAcompanhanteAtom.reportWrite(value, super.cpfAcompanhante, () {
      super.cpfAcompanhante = value;
    });
  }

  late final _$nomeBeneficiarioAtom = Atom(
      name: '_AggregateEscortStoreBase.nomeBeneficiario', context: context);

  @override
  String? get nomeBeneficiario {
    _$nomeBeneficiarioAtom.reportRead();
    return super.nomeBeneficiario;
  }

  @override
  set nomeBeneficiario(String? value) {
    _$nomeBeneficiarioAtom.reportWrite(value, super.nomeBeneficiario, () {
      super.nomeBeneficiario = value;
    });
  }

  late final _$chartAtom =
      Atom(name: '_AggregateEscortStoreBase.chart', context: context);

  @override
  int? get chart {
    _$chartAtom.reportRead();
    return super.chart;
  }

  @override
  set chart(int? value) {
    _$chartAtom.reportWrite(value, super.chart, () {
      super.chart = value;
    });
  }

  late final _$loadingRequestAtom =
      Atom(name: '_AggregateEscortStoreBase.loadingRequest', context: context);

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

  late final _$usuarioAtom =
      Atom(name: '_AggregateEscortStoreBase.usuario', context: context);

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

  late final _$maskFormatterAtom =
      Atom(name: '_AggregateEscortStoreBase.maskFormatter', context: context);

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

  late final _$callPageAsyncAction =
      AsyncAction('_AggregateEscortStoreBase.callPage', context: context);

  @override
  Future callPage(dynamic context, dynamic cpf, dynamic name) {
    return _$callPageAsyncAction.run(() => super.callPage(context, cpf, name));
  }

  @override
  String toString() {
    return '''
cpfAcompanhante: ${cpfAcompanhante},
nomeBeneficiario: ${nomeBeneficiario},
chart: ${chart},
loadingRequest: ${loadingRequest},
usuario: ${usuario},
maskFormatter: ${maskFormatter}
    ''';
  }
}
