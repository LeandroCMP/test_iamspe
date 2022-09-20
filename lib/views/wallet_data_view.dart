import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_wallet.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/wallet_controller.dart';
import 'package:iamspeapp/models/carteiraDados.model.dart';
import 'package:iamspeapp/stores/wallet_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/wallet_animation.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletDataPage extends StatefulWidget {
  const WalletDataPage({Key? key}) : super(key: key);

  @override
  State<WalletDataPage> createState() => _WalletDataPageState();
}

class _WalletDataPageState extends State<WalletDataPage>
    with SingleTickerProviderStateMixin {
  final loginController = Modular.get<LoginController>();
  final walletController = Modular.get<WalletController>();
  final walletStore = Modular.get<WalletStore>();
  CarteiraDadosModel? wallet = CarteiraDadosModel();
  bool? usuarioLogado;

  @override
  void initState() {
    walletStore.controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    walletStore.setupAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wallet = walletController.wallet;
    final alertWallet = AlertWallet();
    return Scaffold(
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Carteirinha',
        helperTitle: 'Carteirinha',
        msg: 'Aqui você tem acesso a sua carteirinha ou de seus beneficiários!',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                walletStore.onShareCarteirinha(context);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF009bae),
                fixedSize: (const Size(120, 40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.file_download_rounded),
                  TextComponent(
                    text: 'Download',
                    textColor: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ),
          wallet == null
              ? const Center(
                  child: Text(
                    'Carteira e QR Code não disponíveis para visualização no momento.',
                  ),
                )
              : Stack(
                  children: [
                    Observer(builder: (_) {
                      return WalletAnimation(
                        animation: walletStore.frontAnimation,
                        child: walletFront(),
                      );
                    }),
                    Observer(builder: (_) {
                      return WalletAnimation(
                        animation: walletStore.backAnimation,
                        child: walletVerse(),
                      );
                    }),
                  ],
                ),
          Container(
            height: 60,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      if (walletStore.isFrontVisible) {
                        walletStore.controller!.forward();
                        walletStore.isFrontVisible = false;
                      } else {
                        walletStore.controller!.reverse();
                        walletStore.isFrontVisible = true;
                      }
                    },
                    child: Observer(builder: (_) {
                      return walletStore.isFrontVisible
                          ? const Text('Virar verso')
                          : const Text('Virar Frente');
                    }),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF004d02),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      walletStore.setBrightness();
                      alertWallet.showAlertDialog(
                        context,
                        '${wallet!.carteira}${wallet!.digitoCarteira}',
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('QR Code'),
                        Icon(Icons.qr_code_2_rounded),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF004d02),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget walletFront() {
    return Container(
      height: 400,
      width: 245,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/carteirinha_iamspe.jpg'),
        ),
      ),
    );
  }

  Widget walletVerse() {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: 245,
        width: 400,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.lightBlue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nº Inscrição:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      '${wallet!.carteira}-${wallet!.digitoCarteira}',
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'CPF:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      wallet!.cpf!,
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nascimento:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      wallet!.dataNascimento!,
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Contribuinte:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      wallet!.nome!,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: QrImage(
                    data: '${wallet!.carteira}${wallet!.digitoCarteira}',
                    version: QrVersions.auto,
                    size: 70,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const Text(
              'Central de atendimento Iamspe: (11)5583-7001',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            const Text(
              'Válida apenas com o documento de identidade',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
