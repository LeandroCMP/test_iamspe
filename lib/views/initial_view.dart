import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_escorts.dart';
import 'package:iamspeapp/alerts/alert_exit.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_store.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:iamspeapp/stores/schedule_store.dart';
import 'package:iamspeapp/stores/telemedicine_store.dart';
import 'package:iamspeapp/stores/wallet_store.dart';
import 'package:iamspeapp/views/components/option_initial_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);
  static const PRIMEIRA_ENTRADA = "PRIMEIRA_ENTRADA";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MenuLateral(),
      appBar: CustomAppBar(
        semVoltar: true,
        hasName: true,
        hasLogo: true,
        hasNotification: true,
        helperTitle: 'Página Inicial',
        msg:
            'Aqui você pode acessar todas as funções do aplicativo de forma simples e ágil!',
      ),
      body: ShowInitialPage(),
    );
  }
}

class ShowInitialPage extends StatefulWidget {
  const ShowInitialPage({Key? key}) : super(key: key);

  @override
  _ShowInitialPageState createState() => _ShowInitialPageState();
}

class _ShowInitialPageState extends State<ShowInitialPage> {
  final alertExit = AlertExit();
  final walletStore = Modular.get<WalletStore>();
  final scheduleStore = Modular.get<ScheduleStore>();
  final telemedicineStore = Modular.get<TelemedicineStore>();
  final registrationDataStore = Modular.get<RegistrationDataStore>();
  final alertScorts = AlertScorts();
  final loginController = Modular.get<LoginController>();
  final initialStore = Modular.get<InitialStore>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: initialStore.carregarDado(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return page(context);
        } else {
          return LoadingComponent(
            isLoading: initialStore.isLoading,
            child: null,
          );
        }
      },
    );
  }

  Widget page(BuildContext context) {
    final loginStore = Modular.get<LoginStore>();
    final accreditedStore = Modular.get<AccreditedStore>();
    return WillPopScope(
      onWillPop: () {
        alertExit.showDialogExit(context);
        return Future(() => false);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.center,
                  spacing: 30,
                  runSpacing: 30,
                  children: [
                    OptionInitialPage(
                      onTap: () {
                        walletStore.callPage(context);
                      },
                      icon: Icons.credit_card_rounded,
                      text: "Carteirinha",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        telemedicineStore.callPage(context);
                      },
                      icon: Icons.account_box_rounded,
                      text: "Telemedicina",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        if (!loginController.tokenExpired(context)) {
                          Modular.to.pushNamed('/financial');
                        }
                      },
                      icon: Icons.bar_chart_outlined,
                      text: "Financeiro",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        scheduleStore.callPageChoose(context);
                      },
                      icon: Icons.calendar_month_rounded,
                      text: "Agendas",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        if (!loginController.tokenExpired(context)) {
                          alertScorts.showAlertScorts(context);
                        }
                      },
                      icon: Icons.group_add_rounded,
                      text: "Acompanhantes",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        Modular.to.pushNamed('/user/profile');
                      },
                      icon: Icons.person,
                      text: "Perfil do Usuário",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        accreditedStore.callPage(context);
                      },
                      icon: Icons.location_city_rounded,
                      text: "Rede Credenciada",
                    ),
                    OptionInitialPage(
                      onTap: () {
                        loginStore.logout(context);
                      },
                      icon: Icons.exit_to_app_rounded,
                      text: "Sair",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
