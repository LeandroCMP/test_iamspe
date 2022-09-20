import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/login_store.dart';

class AlertLogin {
  showAlertDialog(context, message) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText: message ??
              'Ocorreu um problema interno, por favor, tente mais tarde!',
          positiveText: 'Ok',
          onPositiveClick: () {
            final loginStore = Modular.get<LoginStore>();
            loginStore.loadingLogin = false;
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  void showDialogExpiredToken(context) {
    final loginController = Modular.get<LoginController>();
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText: "Sessão expirada, realize o login novamente!",
          positiveText: 'Ok',
          onPositiveClick: () {
            loginController.logout(context);
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  void showDialogUpdate(context, {message}) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: ClassicGeneralDialogWidget(
            titleText: 'Atenção: Aplicativo Desatualizado',
            contentText:
                "Por favor, atualize seu app para a nova versão disponível na Play Store para prosseguir!",
            positiveText: 'Ir para link na Play Store',
            onPositiveClick: () {
              final loginStore = Modular.get<LoginStore>();
              loginStore.launchUpdate();
            },
          ),
          onWillPop: () async => false,
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
