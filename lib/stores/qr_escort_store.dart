import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
part 'qr_escort_store.g.dart';

class QrEscortStore = _QrEscortStoreBase with _$QrEscortStore;

abstract class _QrEscortStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  ScreenshotController screenshotController = ScreenshotController();

  @observable
  AcompanhanteModel escort = AcompanhanteModel();

  @action
  callPage(context, AcompanhanteModel value) {
    if (!loginController.tokenExpired(context)) {
      escort = value;
      setBrightness();
      Modular.to.pushNamed('/escorts/qr');
    }
  }

  @action
  Future<void> setBrightness() async {
    try {
      await ScreenBrightness().setScreenBrightness(1.0);
    } catch (e) {
      dev.log('Erro ao alterar brilho', error: e.toString());
      throw 'Failed to set brightness';
    }
  }

  @action
  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      dev.log('Erro ao resetar brilho', error: e.toString());
      throw 'Failed to reset brightness';
    }
  }

  onShareQrCode(BuildContext context) async {
    try {
      screenshotController
          .captureFromWidget(
        Container(
          padding: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 30, bottom: 60),
          height: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2.0,
              color: Colors.black,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   width: 2.0,
              //   color: Colors.black,
              // ),
            ),
            height: MediaQuery.of(context).size.height * .6,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: const Text(
                    "IAMSPE | INSTITUTO DE ASSISTÊNCIA MÉDICA AO SERVIDOR PÚBLICO ESTADUAL DE SÃO PAULO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Acompanhante",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  escort.nomeAcompanhante!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Paciente",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  escort.paciente!.nomePaciente!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: 150,
                  child: Image.memory(
                    base64Decode(escort.qrCode!),
                    width: 150, fit: BoxFit.fitWidth,
                    gaplessPlayback: true, // prevent redrawing
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Versão App: 2.0.0",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      )
          .then((Uint8List image) async {
        // Handle captured image
        if (Platform.isAndroid) {
          final directory = (await getExternalStorageDirectory())!.path;
          File imgFile = File('$directory/qrCodeAcompanhante.png');
          imgFile.writeAsBytes(image);
          Share.shareFiles([File('$directory/qrCodeAcompanhante.png').path]);
        }

        if (Platform.isIOS) {
          try {
            final directory = (await getApplicationDocumentsDirectory()).path;
            File imgFile = File('$directory/qrCodeAcompanhante.png');
            imgFile.writeAsBytes(image);
            /*var aa = ([File('$directory/qrCodeAcompanhante.png').path]);
            if (aa != null || aa != []) {
              dev.log("quantidadeeeeeeeeeeeeeeeee" + aa.length.toString());

              // await Share.shareFiles(aa);
              dev.log("quantidadeeeeeeeeeeeeeeeee" + aa.length.toString());
            } else {
              dev.log("ERRO");
            }*/

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Download realizado'),
                duration: const Duration(milliseconds: 2000),
                width: 280.0, // Width of the SnackBar.
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, // Inner padding for SnackBar content.
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Erro'),
                duration: const Duration(milliseconds: 2000),
                width: 280.0, // Width of the SnackBar.
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, // Inner padding for SnackBar content.
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          }
        }
      }).catchError((onError) {
        dev.log(onError.toString());
      });
    } on PlatformException catch (e) {
      dev.log("Erro ao enviar qr code:" + e.toString());
    }
  }
}
