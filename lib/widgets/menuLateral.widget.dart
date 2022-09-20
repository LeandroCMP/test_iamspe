import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_escorts.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/mensagens/mensagem-alerta.model.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/schedule_store.dart';
import 'package:iamspeapp/stores/telemedicine_store.dart';
import 'package:iamspeapp/stores/wallet_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/notifications_view.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  final loginController = Modular.get<LoginController>();
  final loginStore = Modular.get<LoginStore>();
  final registrationDataStore = Modular.get<RegistrationDataStore>();
  final beneficiaryStore = Modular.get<BeneficiaryStore>();
  List<MensagemAlertaModel> notificacoes = [];
  List<MensagemAlertaModel> notificacoesBackground = [];
  int totalNotificacoes = 0;

  @override
  void initState() {
    super.initState();
    carregarNotificacoes();
  }

  carregarNotificacoes() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var mensagemJsonBackground = prefs.getString("mensagensBackground");
      var mensagemJson = prefs.getString("mensagens");
      if (mensagemJson != null) {
        setState(() => notificacoes = (jsonDecode(mensagemJson) as List)
            .map((i) => MensagemAlertaModel.fromJson(i))
            .toList());
        for (var item in notificacoes) {
          print("testando notificação ${item.notification!.body}");
        }
        setState(() => totalNotificacoes += notificacoes.length);
      } else {
        setState(() => notificacoes = []);
      }

      if (mensagemJsonBackground != null) {
        setState(() => notificacoesBackground =
            (jsonDecode(mensagemJsonBackground) as List)
                .map((i) => MensagemAlertaModel.fromJson(i))
                .toList());
        setState(() => totalNotificacoes += notificacoesBackground.length);
      } else {
        setState(() => notificacoesBackground = []);
      }
    } catch (e) {
      dev.log('erro : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          //color: Color(0xFF03aabd),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF03aabd),
              Color(0xFF7ec345),
            ],
            stops: [0.4, 0.8],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextComponent(
                        text: Settings.usuario!.nome!,
                        textColor: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 10),
                      TextComponent(
                        text: 'Carteirinha: ${Settings.usuario!.carteira!}',
                        textColor: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.home, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Página Inicial',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (!loginController.tokenExpired(context)) {
                    Scaffold.of(context).closeEndDrawer();
                    final initialStore = Modular.get<InitialStore>();
                    initialStore.callPage();
                  }
                },
              ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.credit_card_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Carteirinhas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  final walletStore = Modular.get<WalletStore>();
                  walletStore.callPage(context);
                },
              ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.account_box_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Telemedicina',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  final telemedicineStore = Modular.get<TelemedicineStore>();
                  telemedicineStore.callPage(context);
                },
              ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.bar_chart_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Financeiro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (!loginController.tokenExpired(context)) {
                    Modular.to.pushNamed('/financial');
                  }
                },
              ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.calendar_month_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Agendas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  final scheduleStore = Modular.get<ScheduleStore>();
                  scheduleStore.callPageChoose(context);
                },
              ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.group_add_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Acompanhantes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  final alertEscorts = AlertScorts();
                  if (!loginController.tokenExpired(context)) {
                    alertEscorts.showAlertScorts(context);
                  }
                },
              ),
              const Divider(height: 5, thickness: 1, color: Colors.white),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.person_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Meus Dados',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  registrationDataStore.callPage(
                    context,
                    Settings.usuario!.idBeneficiario,
                  );
                },
              ),
              if (Platform.isAndroid)
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.white,
                ),
              if (Platform.isAndroid)
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            totalNotificacoes.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Notificações Pendentes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Scaffold.of(context).closeEndDrawer();
                    if (!loginController.tokenExpired(context)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificacoesPage(
                            mensagensCarregadas: notificacoes,
                          ),
                        ),
                      );
                    }
                  },
                ),
              const Divider(
                height: 5,
                thickness: 1,
                color: Colors.white,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .05,
                      child: const Icon(Icons.logout, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Sair',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  loginStore.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
