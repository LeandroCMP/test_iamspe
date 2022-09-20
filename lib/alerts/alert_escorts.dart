import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/stores/aggregate_escort_store.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/stores/escorts_store.dart';

class AlertScorts {
  final scortsStore = Modular.get<ScortsStore>();
  final loginController = Modular.get<LoginController>();
  void showAlertScorts(context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText:
              'Para passar em consulta / exame no Ambulatório do Hospital do'
              ' Servidor Público Estadual é obrigatório o cadastro prévio do'
              ' acompanhante (se houver). Adiante essa etapa cadastrando todos'
              ' os seus acompanhantes!',
          positiveText: 'Ok',
          onPositiveClick: () {
            // ignore: unrelated_type_equality_checks
            Settings.usuario!.vinculoPessoal!.descVinculo! == 'TITULAR'
                ? scortsStore.callPage(context)
                : scortsStore.callPageEscorts(context, 0);
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  void showDialogEscortUpdate(context, String mensagem, bool erro) {
    final insertEscortStore = Modular.get<InsertEscortStore>();
    final aggregateStore = Modular.get<AggregateEscortStore>();
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Atenção!',
          contentText: mensagem,
          positiveText: 'Ok',
          onPositiveClick: () {
            final escortsStore = Modular.get<ScortsStore>();
            if (erro) {
              Modular.to.pop(context);
            } else {
              if (!loginController.tokenExpired(context)) {
                insertEscortStore.agregadoPage == true
                    ? aggregateStore.callPage(
                        context,
                        insertEscortStore.cpfAgregado,
                        insertEscortStore.nomeAgregado,
                      )
                    : escortsStore.callPageEscorts(context, 0);
              }
            }
          },
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
