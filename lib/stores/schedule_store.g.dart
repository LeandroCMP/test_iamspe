// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleStore on _ScheduleStoreBase, Store {
  late final _$scheduleListAtom =
      Atom(name: '_ScheduleStoreBase.scheduleList', context: context);

  @override
  List<AgendaModel> get scheduleList {
    _$scheduleListAtom.reportRead();
    return super.scheduleList;
  }

  @override
  set scheduleList(List<AgendaModel> value) {
    _$scheduleListAtom.reportWrite(value, super.scheduleList, () {
      super.scheduleList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ScheduleStoreBase.isLoading', context: context);

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

  late final _$tabIndexAtom =
      Atom(name: '_ScheduleStoreBase.tabIndex', context: context);

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

  late final _$callPageAsyncAction =
      AsyncAction('_ScheduleStoreBase.callPage', context: context);

  @override
  Future callPage(dynamic context, dynamic index) {
    return _$callPageAsyncAction.run(() => super.callPage(context, index));
  }

  late final _$getDataHistoryAsyncAction =
      AsyncAction('_ScheduleStoreBase.getDataHistory', context: context);

  @override
  Future getDataHistory() {
    return _$getDataHistoryAsyncAction.run(() => super.getDataHistory());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_ScheduleStoreBase.getData', context: context);

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_ScheduleStoreBaseActionController =
      ActionController(name: '_ScheduleStoreBase', context: context);

  @override
  dynamic callPageChoose(dynamic context) {
    final _$actionInfo = _$_ScheduleStoreBaseActionController.startAction(
        name: '_ScheduleStoreBase.callPageChoose');
    try {
      return super.callPageChoose(context);
    } finally {
      _$_ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scheduleList: ${scheduleList},
isLoading: ${isLoading},
tabIndex: ${tabIndex}
    ''';
  }
}
