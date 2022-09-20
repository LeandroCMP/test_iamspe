// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escorts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScortsStore on _ScortsStoreBase, Store {
  late final _$userAtom = Atom(name: '_ScortsStoreBase.user', context: context);

  @override
  UsuarioLogadoModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UsuarioLogadoModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$escortsListAtom =
      Atom(name: '_ScortsStoreBase.escortsList', context: context);

  @override
  PacienteAcompanhanteModel? get escortsList {
    _$escortsListAtom.reportRead();
    return super.escortsList;
  }

  @override
  set escortsList(PacienteAcompanhanteModel? value) {
    _$escortsListAtom.reportWrite(value, super.escortsList, () {
      super.escortsList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ScortsStoreBase.isLoading', context: context);

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

  late final _$userRecordAtom =
      Atom(name: '_ScortsStoreBase.userRecord', context: context);

  @override
  int? get userRecord {
    _$userRecordAtom.reportRead();
    return super.userRecord;
  }

  @override
  set userRecord(int? value) {
    _$userRecordAtom.reportWrite(value, super.userRecord, () {
      super.userRecord = value;
    });
  }

  late final _$addedCompanionAtom =
      Atom(name: '_ScortsStoreBase.addedCompanion', context: context);

  @override
  bool get addedCompanion {
    _$addedCompanionAtom.reportRead();
    return super.addedCompanion;
  }

  @override
  set addedCompanion(bool value) {
    _$addedCompanionAtom.reportWrite(value, super.addedCompanion, () {
      super.addedCompanion = value;
    });
  }

  late final _$escortNameAtom =
      Atom(name: '_ScortsStoreBase.escortName', context: context);

  @override
  String? get escortName {
    _$escortNameAtom.reportRead();
    return super.escortName;
  }

  @override
  set escortName(String? value) {
    _$escortNameAtom.reportWrite(value, super.escortName, () {
      super.escortName = value;
    });
  }

  late final _$cpfEscortsAtom =
      Atom(name: '_ScortsStoreBase.cpfEscorts', context: context);

  @override
  String? get cpfEscorts {
    _$cpfEscortsAtom.reportRead();
    return super.cpfEscorts;
  }

  @override
  set cpfEscorts(String? value) {
    _$cpfEscortsAtom.reportWrite(value, super.cpfEscorts, () {
      super.cpfEscorts = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_ScortsStoreBase.active', context: context);

  @override
  bool? get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool? value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$validationActiveAtom =
      Atom(name: '_ScortsStoreBase.validationActive', context: context);

  @override
  bool get validationActive {
    _$validationActiveAtom.reportRead();
    return super.validationActive;
  }

  @override
  set validationActive(bool value) {
    _$validationActiveAtom.reportWrite(value, super.validationActive, () {
      super.validationActive = value;
    });
  }

  late final _$tabIndexAtom =
      Atom(name: '_ScortsStoreBase.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$activeEscortAtom =
      Atom(name: '_ScortsStoreBase.activeEscort', context: context);

  @override
  AcompanhanteModel get activeEscort {
    _$activeEscortAtom.reportRead();
    return super.activeEscort;
  }

  @override
  set activeEscort(AcompanhanteModel value) {
    _$activeEscortAtom.reportWrite(value, super.activeEscort, () {
      super.activeEscort = value;
    });
  }

  late final _$callPageEscortsCpfAsyncAction =
      AsyncAction('_ScortsStoreBase.callPageEscortsCpf', context: context);

  @override
  Future callPageEscortsCpf(dynamic context, dynamic cpf) {
    return _$callPageEscortsCpfAsyncAction
        .run(() => super.callPageEscortsCpf(context, cpf));
  }

  late final _$getDataAsyncAction =
      AsyncAction('_ScortsStoreBase.getData', context: context);

  @override
  Future getData(dynamic context) {
    return _$getDataAsyncAction.run(() => super.getData(context));
  }

  late final _$getDataCpfAsyncAction =
      AsyncAction('_ScortsStoreBase.getDataCpf', context: context);

  @override
  Future getDataCpf(dynamic context, dynamic cpf) {
    return _$getDataCpfAsyncAction.run(() => super.getDataCpf(context, cpf));
  }

  late final _$changeEscortStatusAsyncAction =
      AsyncAction('_ScortsStoreBase.changeEscortStatus', context: context);

  @override
  Future changeEscortStatus(bool value, AcompanhanteModel escort) {
    return _$changeEscortStatusAsyncAction
        .run(() => super.changeEscortStatus(value, escort));
  }

  late final _$_ScortsStoreBaseActionController =
      ActionController(name: '_ScortsStoreBase', context: context);

  @override
  dynamic callPage(dynamic context) {
    final _$actionInfo = _$_ScortsStoreBaseActionController.startAction(
        name: '_ScortsStoreBase.callPage');
    try {
      return super.callPage(context);
    } finally {
      _$_ScortsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic callPageEscorts(dynamic context, dynamic index) {
    final _$actionInfo = _$_ScortsStoreBaseActionController.startAction(
        name: '_ScortsStoreBase.callPageEscorts');
    try {
      return super.callPageEscorts(context, index);
    } finally {
      _$_ScortsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
escortsList: ${escortsList},
isLoading: ${isLoading},
userRecord: ${userRecord},
addedCompanion: ${addedCompanion},
escortName: ${escortName},
cpfEscorts: ${cpfEscorts},
active: ${active},
validationActive: ${validationActive},
tabIndex: ${tabIndex},
activeEscort: ${activeEscort}
    ''';
  }
}
