import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/initial_store.dart';

class AlertFirstAccess {
  void showDialog(context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText:
              "Em caso de dúvidas, acesse a página de Informações presente no menu lateral!",
          positiveText: 'Ok',
          onPositiveClick: () {
            final initialStore = Modular.get<InitialStore>();
            initialStore.callPage();
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
