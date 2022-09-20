import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/aggregate_escort_store.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/escorts_list_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class AggregateEscortPage extends StatefulWidget {
  const AggregateEscortPage({
    Key? key,
  }) : super(key: key);
  @override
  _AggregateEscortPageState createState() => _AggregateEscortPageState();
}

class _AggregateEscortPageState extends State<AggregateEscortPage>
    with SingleTickerProviderStateMixin {
  final aggregateStore = Modular.get<AggregateEscortStore>();
  final insertEscortStore = Modular.get<InsertEscortStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        semVoltar: false,
        hasLogo: false,
        hasSection: true,
        section: 'Acompanhantes',
        helperTitle: 'Acompanhantes',
        msg:
            'Aqui você pode consultar toda a lista de acompanhantes de seu beneficiario!',
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextComponent(
              text: "Acompanhantes de: ${aggregateStore.nomeBeneficiario!}",
              textColor: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            const Expanded(child: EscortsList()),
            Observer(builder: (_) {
              return Visibility(
                visible: true,
                child: ElevatedButtonComponent(
                  onPressed: () {
                    insertEscortStore.callPage(
                      context,
                      name: aggregateStore.nomeBeneficiario,
                      cpf: aggregateStore.cpfAcompanhante,
                      chart: aggregateStore.chart,
                    );
                  },
                  height: 60,
                  width: double.maxFinite,
                  color: const Color(0xFF004d02),
                  loadingLogin: false,
                  text: const TextComponent(
                    text: 'Novo Acompanhante',
                    textColor: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
