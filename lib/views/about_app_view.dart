import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  _AboutAppPageState createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: false,
        hasLogo: false,
        hasSection: true,
        section: 'Sobre o APP',
        helperTitle: 'Sobre o Aplicativo',
        msg:
            'Aqui você tem acesso a todas as informações sobre o aplicativo, como versão e dúvidas!',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                connectionCard(),
                const SizedBox(height: 20),
                notificationsCard(),
                const SizedBox(height: 20),
                doubtsCard(),
                const SizedBox(height: 20),
                versionCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget versionCard() {
    final size = MediaQuery.of(context).size;
    final loginStore = Modular.get<LoginStore>();
    return Container(
      height: 70,
      width: size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf0f0f0),
        border: Border.all(
          color: const Color(0xFFe6e6e6),
        ),
        borderRadius: BorderRadius.circular(05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.error_rounded),
              SizedBox(width: 10),
              TextComponent(
                text: "Versão",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 35),
              TextComponent(
                text: loginStore.version,
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget connectionCard() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf0f0f0),
        border: Border.all(
          color: const Color(0xFFe6e6e6),
        ),
        borderRadius: BorderRadius.circular(05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.cast_connected_rounded),
              SizedBox(width: 10),
              TextComponent(
                text: "Conexão",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 35),
              Expanded(
                child: TextComponent(
                  text: 'Verifique se você está conectado à internet para'
                      ' garantir o acesso às funcionalidades do aplicativo.',
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget notificationsCard() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf0f0f0),
        border: Border.all(
          color: const Color(0xFFe6e6e6),
        ),
        borderRadius: BorderRadius.circular(05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.notifications_active),
              SizedBox(width: 10),
              TextComponent(
                text: "Permitir notificações",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 35),
              Expanded(
                child: TextComponent(
                  text: 'Acompanhe as informações e esteja sempre atualizado'
                      ' sobre as novidades de seu plano.',
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget doubtsCard() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFf0f0f0),
        border: Border.all(
          color: const Color(0xFFe6e6e6),
        ),
        borderRadius: BorderRadius.circular(05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.question_mark_rounded),
              SizedBox(width: 10),
              TextComponent(
                text: "Dúvidas",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 35),
              Expanded(
                child: Column(
                  children: [
                    const TextComponent(
                      text:
                          'No botão abaixo, você encontra, além de dados sobre o aplicativo do Iamspe'
                          ', informações sobre uso do QR Code por pacientes e acompanhantes e acessos'
                          ' a serviços ambulatoriais, entre outras.',
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonComponent(
                      onPressed: () {
                        _launchBrowser();
                      },
                      width: double.maxFinite,
                      height: 40,
                      color: const Color(0xFF004d02),
                      text: const TextComponent(
                        text: 'Tire suas Dúvidas',
                        textColor: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      loadingLogin: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchBrowser() async {
    var url = Uri.parse(
      'http://www.iamspe.sp.gov.br/espaco-do-usuario/portal-do-usuario/tire-suas-duvidas/',
    );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
    throw 'Could not launch $url';
  }
}
