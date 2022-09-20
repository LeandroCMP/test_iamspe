import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/views/initial_view.dart';

class AlertRegistration {
  void showDialogRegistration(
      BuildContext context, String mensagem, bool voltar) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: Text(
            mensagem,
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                /*if (!loginController.tokenExpired(context)) {
                  if (voltar) {
                    Navigator.pop(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InitialPage()),
                    );
                  }
                }*/
              },
            ),
          ],
        );
      },
    );
  }

  void showDialogMsg(context, String mensagem, bool voltar) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText: mensagem,
          positiveText: 'Ok',
          onPositiveClick: () {
            final loginController = Modular.get<LoginController>();
            if (!loginController.tokenExpired(context)) {
              if (voltar) {
                Navigator.pop(context);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InitialPage()),
                );
              }
            }
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
