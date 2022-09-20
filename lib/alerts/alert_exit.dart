import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlertExit {
  void showDialogExit(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
            "Você está prestes a fechar o aplicativo, tem certeza que deseja sair?",
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Não',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                'Sim',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Modular.to.pop(context);
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
