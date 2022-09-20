// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accredited_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccreditedStore on _AccreditedStoreBase, Store {
  late final _$citiesAtom =
      Atom(name: '_AccreditedStoreBase.cities', context: context);

  @override
  List<CidadesModel> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<CidadesModel> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  late final _$accreditedAtom =
      Atom(name: '_AccreditedStoreBase.accredited', context: context);

  @override
  List<CredenciadosModel>? get accredited {
    _$accreditedAtom.reportRead();
    return super.accredited;
  }

  @override
  set accredited(List<CredenciadosModel>? value) {
    _$accreditedAtom.reportWrite(value, super.accredited, () {
      super.accredited = value;
    });
  }

  late final _$specialtiesAtom =
      Atom(name: '_AccreditedStoreBase.specialties', context: context);

  @override
  List<EspecialidadesModel>? get specialties {
    _$specialtiesAtom.reportRead();
    return super.specialties;
  }

  @override
  set specialties(List<EspecialidadesModel>? value) {
    _$specialtiesAtom.reportWrite(value, super.specialties, () {
      super.specialties = value;
    });
  }

  late final _$cityIdAtom =
      Atom(name: '_AccreditedStoreBase.cityId', context: context);

  @override
  int? get cityId {
    _$cityIdAtom.reportRead();
    return super.cityId;
  }

  @override
  set cityId(int? value) {
    _$cityIdAtom.reportWrite(value, super.cityId, () {
      super.cityId = value;
    });
  }

  late final _$specialtiesIdAtom =
      Atom(name: '_AccreditedStoreBase.specialtiesId', context: context);

  @override
  int? get specialtiesId {
    _$specialtiesIdAtom.reportRead();
    return super.specialtiesId;
  }

  @override
  set specialtiesId(int? value) {
    _$specialtiesIdAtom.reportWrite(value, super.specialtiesId, () {
      super.specialtiesId = value;
    });
  }

  late final _$loadingRequestAtom =
      Atom(name: '_AccreditedStoreBase.loadingRequest', context: context);

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

  late final _$getDataAtom =
      Atom(name: '_AccreditedStoreBase.getData', context: context);

  @override
  bool get getData {
    _$getDataAtom.reportRead();
    return super.getData;
  }

  @override
  set getData(bool value) {
    _$getDataAtom.reportWrite(value, super.getData, () {
      super.getData = value;
    });
  }

  late final _$visibilitySearchAtom =
      Atom(name: '_AccreditedStoreBase.visibilitySearch', context: context);

  @override
  bool get visibilitySearch {
    _$visibilitySearchAtom.reportRead();
    return super.visibilitySearch;
  }

  @override
  set visibilitySearch(bool value) {
    _$visibilitySearchAtom.reportWrite(value, super.visibilitySearch, () {
      super.visibilitySearch = value;
    });
  }

  late final _$visibilityResultAtom =
      Atom(name: '_AccreditedStoreBase.visibilityResult', context: context);

  @override
  bool get visibilityResult {
    _$visibilityResultAtom.reportRead();
    return super.visibilityResult;
  }

  @override
  set visibilityResult(bool value) {
    _$visibilityResultAtom.reportWrite(value, super.visibilityResult, () {
      super.visibilityResult = value;
    });
  }

  late final _$searchDataAsyncAction =
      AsyncAction('_AccreditedStoreBase.searchData', context: context);

  @override
  Future searchData(dynamic context) {
    return _$searchDataAsyncAction.run(() => super.searchData(context));
  }

  late final _$getCityAsyncAction =
      AsyncAction('_AccreditedStoreBase.getCity', context: context);

  @override
  Future getCity() {
    return _$getCityAsyncAction.run(() => super.getCity());
  }

  late final _$getSpecialtiesAsyncAction =
      AsyncAction('_AccreditedStoreBase.getSpecialties', context: context);

  @override
  Future getSpecialties() {
    return _$getSpecialtiesAsyncAction.run(() => super.getSpecialties());
  }

  late final _$_AccreditedStoreBaseActionController =
      ActionController(name: '_AccreditedStoreBase', context: context);

  @override
  dynamic callPage(dynamic context) {
    final _$actionInfo = _$_AccreditedStoreBaseActionController.startAction(
        name: '_AccreditedStoreBase.callPage');
    try {
      return super.callPage(context);
    } finally {
      _$_AccreditedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changed(bool visibility, String field) {
    final _$actionInfo = _$_AccreditedStoreBaseActionController.startAction(
        name: '_AccreditedStoreBase.changed');
    try {
      return super.changed(visibility, field);
    } finally {
      _$_AccreditedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecaoEspecialidade(dynamic value) {
    final _$actionInfo = _$_AccreditedStoreBaseActionController.startAction(
        name: '_AccreditedStoreBase.selecaoEspecialidade');
    try {
      return super.selecaoEspecialidade(value);
    } finally {
      _$_AccreditedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectCity(dynamic value) {
    final _$actionInfo = _$_AccreditedStoreBaseActionController.startAction(
        name: '_AccreditedStoreBase.selectCity');
    try {
      return super.selectCity(value);
    } finally {
      _$_AccreditedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic back() {
    final _$actionInfo = _$_AccreditedStoreBaseActionController.startAction(
        name: '_AccreditedStoreBase.back');
    try {
      return super.back();
    } finally {
      _$_AccreditedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cities: ${cities},
accredited: ${accredited},
specialties: ${specialties},
cityId: ${cityId},
specialtiesId: ${specialtiesId},
loadingRequest: ${loadingRequest},
getData: ${getData},
visibilitySearch: ${visibilitySearch},
visibilityResult: ${visibilityResult}
    ''';
  }
}
