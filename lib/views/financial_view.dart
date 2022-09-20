import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/tax_declaration_store.dart';
import 'package:iamspeapp/stores/ticket_store.dart';
import 'package:iamspeapp/views/components/card_menu_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({Key? key}) : super(key: key);

  @override
  _FinancialPageState createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> {
  final loginController = Modular.get<LoginController>();
  final ticketStore = Modular.get<TicketStore>();
  final taxDeclarationStore = Modular.get<TaxDeclarationStore>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Financeiro',
        helperTitle: 'Menu Financeiro',
        msg:
            'Aqui você tem acesso ao menu financeiro, onde pode consultar a segunda via de seus boletos, e declaração do imposto de renda!',
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
                title: 'Segunda Via do Boleto',
                subtitle: 'Consulte aqui a segunda via do seu boleto',
                onTap: () => ticketStore.callPage(context),
              ),
              const SizedBox(
                height: 20,
              ),
              CardMenuComponent(
                title: 'Declaração para fins de Imposto de Renda',
                subtitle: 'Consulte aqui os pagamentos feitos ao Iamspe',
                onTap: () =>
                    taxDeclarationStore.callPageDeclarationList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
