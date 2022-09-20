// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BeneficiaryStore on _BeneficiaryStoreBase, Store {
  late final _$usuarioAtom =
      Atom(name: '_BeneficiaryStoreBase.usuario', context: context);

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

  late final _$listaBeneficiariosAtom =
      Atom(name: '_BeneficiaryStoreBase.listaBeneficiarios', context: context);

  @override
  List<CarteiraModel> get listaBeneficiarios {
    _$listaBeneficiariosAtom.reportRead();
    return super.listaBeneficiarios;
  }

  @override
  set listaBeneficiarios(List<CarteiraModel> value) {
    _$listaBeneficiariosAtom.reportWrite(value, super.listaBeneficiarios, () {
      super.listaBeneficiarios = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BeneficiaryStoreBase.isLoading', context: context);

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

  late final _$futureBenefAtom =
      Atom(name: '_BeneficiaryStoreBase.futureBenef', context: context);

  @override
  Future<dynamic>? get futureBenef {
    _$futureBenefAtom.reportRead();
    return super.futureBenef;
  }

  @override
  set futureBenef(Future<dynamic>? value) {
    _$futureBenefAtom.reportWrite(value, super.futureBenef, () {
      super.futureBenef = value;
    });
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
listaBeneficiarios: ${listaBeneficiarios},
isLoading: ${isLoading},
futureBenef: ${futureBenef}
    ''';
  }
}
