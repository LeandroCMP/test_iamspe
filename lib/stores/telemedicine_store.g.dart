// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemedicine_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TelemedicineStore on _TelemedicineStoreBase, Store {
  late final _$userAtom =
      Atom(name: '_TelemedicineStoreBase.user', context: context);

  @override
  UsuarioLogadoModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UsuarioLogadoModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$retornoAtendimentoAtom =
      Atom(name: '_TelemedicineStoreBase.retornoAtendimento', context: context);

  @override
  RetornoAtendimentoModel? get retornoAtendimento {
    _$retornoAtendimentoAtom.reportRead();
    return super.retornoAtendimento;
  }

  @override
  set retornoAtendimento(RetornoAtendimentoModel? value) {
    _$retornoAtendimentoAtom.reportWrite(value, super.retornoAtendimento, () {
      super.retornoAtendimento = value;
    });
  }

  late final _$listaAgendamentosAtom =
      Atom(name: '_TelemedicineStoreBase.listaAgendamentos', context: context);

  @override
  List<TelemedicinaModel>? get listaAgendamentos {
    _$listaAgendamentosAtom.reportRead();
    return super.listaAgendamentos;
  }

  @override
  set listaAgendamentos(List<TelemedicinaModel>? value) {
    _$listaAgendamentosAtom.reportWrite(value, super.listaAgendamentos, () {
      super.listaAgendamentos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TelemedicineStoreBase.isLoading', context: context);

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

  late final _$_TelemedicineStoreBaseActionController =
      ActionController(name: '_TelemedicineStoreBase', context: context);

  @override
  dynamic callPage(dynamic context) {
    final _$actionInfo = _$_TelemedicineStoreBaseActionController.startAction(
        name: '_TelemedicineStoreBase.callPage');
    try {
      return super.callPage(context);
    } finally {
      _$_TelemedicineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
retornoAtendimento: ${retornoAtendimento},
listaAgendamentos: ${listaAgendamentos},
isLoading: ${isLoading}
    ''';
  }
}
