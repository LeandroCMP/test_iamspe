import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/declaration_schedule_list_store.dart';

class AlertSchedule {
  void showDialogSchedule(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
            "Aqui estão disponíveis as declarações de comparecimento ao HSPE de pacientes e acompanhantes somente nas áreas em que a entrada é feita mediante apresentação do QR Code."
            "\n"
            "Nos demais locais do hospital, solicite a declaração de comparecimento na abertura da ficha de atendimento.",
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                final declarationScheduleListStore =
                    Modular.get<DeclarationScheduleListStore>();
                Modular.to.pop();
                declarationScheduleListStore.callPage(context);
              },
            ),
          ],
        );
      },
    );
  }
}
