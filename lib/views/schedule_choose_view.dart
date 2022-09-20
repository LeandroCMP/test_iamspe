import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_schedule.dart';
import 'package:iamspeapp/stores/schedule_store.dart';
import 'package:iamspeapp/views/components/card_menu_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class ScheduleChoosePage extends StatelessWidget {
  const ScheduleChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleStore = Modular.get<ScheduleStore>();
    final alertSchedule = AlertSchedule();
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Agendas',
        helperTitle: 'Menu de Agendas',
        msg:
            'Aqui você tem acesso ao menu de agendas, podendo consultar seu histórico, suas agendas futuras e suas declarações de comparecimento!',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            CardMenuComponent(
              title: 'Histórico de Agendas',
              subtitle: 'Consulte aqui seu histórico de agendas',
              onTap: () => scheduleStore.callPage(context, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            CardMenuComponent(
              title: 'Agendas Futuras',
              subtitle: 'Consulte aqui suas agendas futuras',
              onTap: () => scheduleStore.callPage(context, 1),
            ),
            const SizedBox(
              height: 20,
            ),
            CardMenuComponent(
              title: 'Declaração de Comparecimento',
              subtitle: 'Consulte aqui suas declarações',
              onTap: () => alertSchedule.showDialogSchedule(context),
            ),
          ],
        ),
      ),
    );
  }
}
