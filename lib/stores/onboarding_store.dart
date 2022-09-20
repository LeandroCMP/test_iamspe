import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  @observable
  PageController pageController = PageController(initialPage: 0);

  @observable
  int index = 0;

  @action
  backStep() {
    if (pageController.hasClients) {
      index != 0 ? index = pageController.page!.toInt() - 1 : index = 0;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @action
  nextStep() {
    if (pageController.hasClients) {
      index != 5 ? index = pageController.page!.toInt() + 1 : index = 2;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
