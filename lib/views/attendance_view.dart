import 'package:flutter/material.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Atendimento',
        helperTitle: 'Atendimento',
        msg: 'Aqui você pode consultar seus canais de atendimento',
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            attendanceCentral(),
            const SizedBox(height: 20),
            ombudsmanCentral(),
            const SizedBox(height: 20),
            moreInfos(),
          ]),
        ),
      ),
    );
  }

  Widget attendanceCentral() {
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
              Icon(Icons.description),
              SizedBox(width: 10),
              TextComponent(
                text: "Cadastro e Arrecadação",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const TextComponent(
                      text:
                          'Para atualização cadastral e questões financeiras (Arrecadação), ligar no telefone (11) 4573-8181, de segunda a sexta, das 9h às 16h.',
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonComponent(
                      onPressed: () {
                        _launchCallPhone('1145738181');
                      },
                      width: double.maxFinite,
                      height: 40,
                      color: const Color(0xFF004d02),
                      text: const TextComponent(
                        text: 'Ligar',
                        textColor: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      loadingLogin: false,
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone_in_talk_rounded),
                        SizedBox(width: 10),
                        TextComponent(
                          text: "Central de Atendimento",
                          textColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    const TextComponent(
                      text:
                          'Para agendar ou desmarcar consultas ou exames no HSPE ou obter informações sobre rede credenciada,'
                          ' ligue para a Central de Atendimento do Iamspe, no telefone (11) 5583-7001, de segunda a sexta, das 7h às 19h. ',
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonComponent(
                      onPressed: () {
                        _launchCallPhone('1155837001');
                      },
                      width: double.maxFinite,
                      height: 40,
                      color: const Color(0xFF004d02),
                      text: const TextComponent(
                        text: 'Ligar',
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

  Widget ombudsmanCentral() {
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
              Icon(Icons.perm_phone_msg_rounded),
              SizedBox(width: 10),
              TextComponent(
                text: "Contato Ouvidoria",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextComponent(
                      text: 'E-mail: ouvidoria@iamspe.sp.gov.br',
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButtonComponent(
                      onPressed: () {
                        _launchEmail();
                      },
                      width: double.maxFinite,
                      height: 40,
                      color: const Color(0xFF004d02),
                      text: const TextComponent(
                        text: 'Enviar Email',
                        textColor: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      loadingLogin: false,
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 10),
                    const TextComponent(
                      text: 'Telefones:',
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 05),
                    Row(
                      children: [
                        const TextComponent(
                          text: '(11) 4573-8696',
                          textColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          maxLines: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _launchCallPhone('1145738696');
                          },
                          child: const TextComponent(
                            text: 'Ligar',
                            textColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextComponent(
                          text: '(11) 4573-8993',
                          textColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          maxLines: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _launchCallPhone('1145738993');
                          },
                          child: const TextComponent(
                            text: 'Ligar',
                            textColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextComponent(
                          text: '(11) 4573-8734',
                          textColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          maxLines: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _launchCallPhone('1145738734');
                          },
                          child: const TextComponent(
                            text: 'Ligar',
                            textColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextComponent(
                          text: '(11) 4573-8713',
                          textColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          maxLines: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _launchCallPhone('1145738713');
                          },
                          child: const TextComponent(
                            text: 'Ligar',
                            textColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextComponent(
                          text: '(11) 4573-9998',
                          textColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          maxLines: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            _launchCallPhone('1145739998');
                          },
                          child: const TextComponent(
                            text: 'Ligar',
                            textColor: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
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

  Widget moreInfos() {
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
              Icon(Icons.more_horiz_rounded),
              SizedBox(width: 10),
              TextComponent(
                text: "Mais Informações",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextComponent(
                      text: 'Para saber mais informações',
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
                        text: 'Acesse aqui!',
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

  Future<void> _launchCallPhone(phone) async {
    final Uri url = Uri(scheme: 'tel', path: phone);
    await launchUrl(url);
    throw 'Could not launch $url';
  }

  Future<void> _launchEmail() async {
    final Uri url = Uri(scheme: 'mailto', path: 'ouvidoria@iamspe.sp.gov.br');
    await launchUrl(url);
    throw 'Could not launch $url';
  }

  Future<void> _launchBrowser() async {
    var url = Uri.parse(
      'http://www.iamspe.sp.gov.br/quem-somos/fale-conosco/',
    );
    await launchUrl(url);
    throw 'Could not launch $url';
  }
}
