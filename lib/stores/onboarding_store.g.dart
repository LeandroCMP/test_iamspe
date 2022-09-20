// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on _OnboardingStoreBase, Store {
  late final _$pageControllerAtom =
      Atom(name: '_OnboardingStoreBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_OnboardingStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_OnboardingStoreBaseActionController =
      ActionController(name: '_OnboardingStoreBase', context: context);

  @override
  dynamic backStep() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.backStep');
    try {
      return super.backStep();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextStep() {
    final _$actionInfo = _$_OnboardingStoreBaseActionController.startAction(
        name: '_OnboardingStoreBase.nextStep');
    try {
      return super.nextStep();
    } finally {
      _$_OnboardingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
index: ${index}
    ''';
  }
}
