import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/qr_escort_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class QRCodeEscortPage extends StatefulWidget {
  const QRCodeEscortPage({Key? key}) : super(key: key);
  @override
  _QRCodeEscortPageState createState() => _QRCodeEscortPageState();
}

class _QRCodeEscortPageState extends State<QRCodeEscortPage> {
  final qrEscortStore = Modular.get<QrEscortStore>();

  @override
  Widget build(BuildContext context) {
    return qrEscortStore.escort.qrCode == null
        ? WillPopScope(
            onWillPop: () async {
              qrEscortStore.resetBrightness();
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              endDrawer: const MenuLateral(),
              appBar: const CustomAppBar(
                hasLogo: false,
                hasSection: true,
                section: 'QR Code',
                helperTitle: 'QR Code',
                msg:
                    'Aqui você pode visualizar e compartilhar o QR Code do acompanhante escolhido!',
              ),
              body: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Acompanhante e QR Code não disponíveis para exibição",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              qrEscortStore.resetBrightness();
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              endDrawer: const MenuLateral(),
              appBar: const CustomAppBar(
                hasLogo: false,
                hasSection: true,
                section: 'QR Code',
                helperTitle: 'QR Code',
                msg:
                    'Aqui você pode visualizar e compartilhar o QR Code do acompanhante escolhido!',
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const TextComponent(
                        text: 'Paciente',
                        textColor: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      Text(
                        qrEscortStore.escort.paciente!.nomePaciente!,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextComponent(
                        text: 'Acompanhante',
                        textColor: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      Text(
                        qrEscortStore.escort.nomeAcompanhante!,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.memory(
                          base64Decode(
                            qrEscortStore.escort.qrCode!,
                          ),
                          fit: BoxFit.fitWidth,
                          gaplessPlayback: true,
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const TextComponent(
                              text: 'Compartilhar o QR Code',
                              textColor: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 15),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: const Color(0xFF004d02),
                              child: IconButton(
                                onPressed: () {
                                  qrEscortStore.onShareQrCode(context);
                                },
                                icon: const Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
