import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/views/components/card_menu_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class ChooseScorts extends StatelessWidget {
  const ChooseScorts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final escortsStore = Modular.get<ScortsStore>();
    final insertEscortStore = Modular.get<InsertEscortStore>();
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Acompanhantes',
        helperTitle: 'Menu de Acompanhantes',
        msg:
            'Aqui você tem acesso ao menu para as funções relacionadas aos acompanhantes e beneficiários!',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Se o paciente vier acompanhado ao HSPE no dia da consulta ou exame'
                ', é obrigatório o cadastro prévio do acompanhante.'
                ' Adiante esta etapa cadastrando antes seus acompanhantes.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              CardMenuComponent(
                title: 'Cadastrar Acompanhante',
                subtitle: 'Cadastre aqui seu acompanhante',
                onTap: () {
                  insertEscortStore.callPage(
                    context,
                    chart: escortsStore.userRecord,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardMenuComponent(
                title: 'Meus Acompanhantes',
                subtitle: 'Consulte aqui os seus acompanhantes',
                onTap: () {
                  escortsStore.tabIndex = 0;
                  escortsStore.callPageEscorts(context, 0);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardMenuComponent(
                title: 'Meus Beneficiários',
                subtitle: 'Consulte aqui seus beneficiários',
                onTap: () {
                  escortsStore.callPageEscorts(context, 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
