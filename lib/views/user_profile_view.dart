import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:iamspeapp/stores/tax_declaration_store.dart';
import 'package:iamspeapp/stores/ticket_store.dart';
import 'package:iamspeapp/views/components/card_menu_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final loginController = Modular.get<LoginController>();
  final ticketStore = Modular.get<TicketStore>();
  final taxDeclarationStore = Modular.get<TaxDeclarationStore>();
  final registrationDataStore = Modular.get<RegistrationDataStore>();
  final beneficiaryStore = Modular.get<BeneficiaryStore>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasName: true,
        helperTitle: 'Perfil do Usuário',
        msg: 'Aqui você tem acesso a todas as opções disponíveis para'
            ' o usuário, sendo elas, saber mais sobre o app, ter acesso'
            ' aos canais de atendimento, ter acesso aos seus beneficiários,'
            ' quanto os tiver, e seus dados cadastrais!',
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              CardMenuComponent(
                title: 'Seus Dados',
                subtitle: 'Consulte aqui seus dados cadastrais',
                onTap: () {
                  registrationDataStore.callPage(
                    context,
                    Settings.usuario!.idBeneficiario,
                  );
                },
              ),
              const SizedBox(height: 20),
              CardMenuComponent(
                title: 'Atendimento',
                subtitle: 'Consulte aqui os canais de atendimento',
                onTap: () {
                  if (!loginController.tokenExpired(context)) {
                    Modular.to.pushNamed('/attendance');
                  }
                },
              ),
              const SizedBox(height: 20),
              Settings.usuario!.vinculoPessoal!.descVinculo! == 'TITULAR'
                  ? CardMenuComponent(
                      title: 'Seus Beneficiários',
                      subtitle: 'Consulte aqui sua lista de beneficiários',
                      onTap: () {
                        if (!loginController.tokenExpired(context)) {
                          beneficiaryStore.callPage(context);
                        }
                      },
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              CardMenuComponent(
                title: 'Sobre o Aplicativo',
                subtitle: 'Consulte aqui informações sobre o app',
                onTap: () {
                  if (!loginController.tokenExpired(context)) {
                    Modular.to.pushNamed('/about');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
