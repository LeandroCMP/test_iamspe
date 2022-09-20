import 'package:flutter/material.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/beneficiary_list_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class DadosBeneficiariosPage extends StatefulWidget {
  const DadosBeneficiariosPage({Key? key}) : super(key: key);

  @override
  _DadosBeneficiariosPageState createState() => _DadosBeneficiariosPageState();
}

class _DadosBeneficiariosPageState extends State<DadosBeneficiariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Beneficiários',
        helperTitle: 'Beneficiários',
        msg: 'Aqui você pode consultar toda a sua lista de beneficiários!',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              // height: 80,
              color: Colors.white,
              child: Column(
                children: const <Widget>[
                  TextComponent(
                    text: "Lista de Beneficiários:",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BeneficiaryDataPage(
                edicaoPerfil: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
