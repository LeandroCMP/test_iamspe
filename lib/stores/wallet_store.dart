import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/wallet_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer' as dev;
import '../models/carteira.model.dart';
part 'wallet_store.g.dart';

class WalletStore = _WalletStoreBase with _$WalletStore;

abstract class _WalletStoreBase with Store {
  final walletController = Modular.get<WalletController>();
  final loginController = Modular.get<LoginController>();
  ScreenshotController screenshotController = ScreenshotController();

  @observable
  List<CarteiraModel>? walletList = <CarteiraModel>[];

  @observable
  bool isLoading = true;

  @observable
  double brightness = 0;

  @observable
  AnimationController? controller;

  @observable
  Animation<double>? frontAnimation;

  @observable
  Animation<double>? backAnimation;

  @observable
  bool isFrontVisible = true;

  @observable
  double originalBrightness = 0;

  @action
  Future<List<CarteiraModel>?> getData() async {
    try {
      final result = await walletController.getData();
      walletList = result;
    } catch (ex) {
      dev.log('Erro de exception', error: ex.toString());
    }
    return null;
  }

  @action
  setWalletData(
    String? idHolderParameter,
    String? idBeneficiaryParameter,
    double brightnessParameter,
  ) async {
    walletController.idHolder = idHolderParameter;
    walletController.idBeneficiary = idBeneficiaryParameter;
    isFrontVisible = true;
    walletController.getWallet();
  }

  @action
  callPage(context) {
    if (!loginController.tokenExpired(context)) {
      getData();
      Modular.to.pushNamed('/wallet');
    }
  }

  @action
  void setupAnimation() {
    final bool rotateToLeft = isFrontVisible;
    frontAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: rotateToLeft ? (pi / 2) : (-pi / 2),
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)),
        weight: 50,
      ),
    ]).animate(controller!);

    backAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: rotateToLeft ? (-pi / 2) : (pi / 2),
          end: 0,
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 50,
      )
    ]).animate(controller!);
  }

  Future<void> setBrightness() async {
    try {
      await ScreenBrightness().setScreenBrightness(1.0);
    } catch (e) {
      dev.log('Erro ao alterar brilho', error: e.toString());
      throw 'Failed to set brightness';
    }
  }

  onShareCarteirinha(BuildContext context) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      screenshotController
          .captureFromWidget(
        Container(
          width: 400,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  width: 210,
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/carteirinha_iamspe.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RotatedBox(
                quarterTurns: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: 350,
                  height: 210,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .53,
                                  //color: Colors.pink,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text(
                                          "Nº inscrição:",
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          walletController.wallet!.carteira! +
                                              "-" +
                                              walletController
                                                  .wallet!.digitoCarteira!,
                                          style: const TextStyle(
                                            fontSize: 9,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 5),
                                        child: Text("CPF: ",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        //top: 20),
                                        child: Text(
                                            walletController.wallet!.cpf!,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: Colors.black)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 5, top: 10),
                                        child: Text("Nascimento: ",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: Text(
                                            walletController
                                                .wallet!.dataNascimento!,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: Colors.black)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const <Widget>[],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: QrImage(
                                      data:
                                          '${walletController.wallet!.carteira}${walletController.wallet!.digitoCarteira}',
                                      version: QrVersions.auto,
                                      size: 200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 5),
                                      child: walletController
                                                  .wallet!
                                                  .vinculoPessoal!
                                                  .descVinculo! ==
                                              'TITULAR'
                                          ? const Text("Contribuinte:",
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black))
                                          : const Text("Beneficiário:",
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: SizedBox(
                                        // color: Colors.blue,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                        child: Text(
                                          walletController.wallet!.nome!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                              fontSize: 9, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Central de atendimento Iamspe: (11) 5583-7001",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                      "Valida apenas com o documento de identidade",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Versão App: " + packageInfo.version,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      )
          .then((Uint8List image) async {
        if (Platform.isAndroid) {
          final directory = (await getExternalStorageDirectory())!.path;
          File imgFile = File('$directory/carteirinha.png');
          imgFile.writeAsBytes(image);
          Share.shareFiles([File('$directory/carteirinha.png').path]);
        }
        if (Platform.isIOS) {
          try {
            final directory = (await getApplicationDocumentsDirectory()).path;

            File imgFile = File('$directory/carteirinha.png');
            imgFile.writeAsBytes(image);

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
        dev.log(
          'Erro catherror ao compartilhar carteirinha na store',
          error: onError.toString(),
        );
      });
    } on PlatformException catch (e) {
      dev.log(
        "Erro ao enviar qr code:",
        error: e.toString(),
      );
    }
  }
}
