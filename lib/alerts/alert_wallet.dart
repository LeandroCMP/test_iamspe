import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';

class AlertWallet {
  showAlertDialog(context, idWallet) {
    Future<void> resetBrightness() async {
      try {
        await ScreenBrightness().resetScreenBrightness();
        Modular.to.pop();
      } catch (e) {
        dev.log('Erro ao resetar brilho', error: e.toString());
        throw 'Failed to reset brightness';
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            resetBrightness();
            return Future(() => false);
          },
          child: AlertDialog(
            title: const Text("QR Code"),
            content: SizedBox(
              height: 400,
              width: 300,
              child: Column(
                children: [
                  QrImage(
                    data: idWallet,
                    version: QrVersions.auto,
                    size: 300,
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      final escortsStore = Modular.get<ScortsStore>();
                      resetBrightness();
                      escortsStore.callPageEscorts(context, 0);
                    },
                    child: const Text('Está com acompanhante?'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF004d02),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // define os botões na base do dialogo
              TextButton(
                child: const Text("Fechar"),
                onPressed: () {
                  resetBrightness();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
