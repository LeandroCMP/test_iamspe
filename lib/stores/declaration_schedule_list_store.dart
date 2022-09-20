import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_declaration_schedule.dart';
import 'package:iamspeapp/app/controllers/declaration_schedule_controller.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/declaracaoComparecimento.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/stores/statement_attendance_store.dart';

import 'package:mobx/mobx.dart';
part 'declaration_schedule_list_store.g.dart';

class DeclarationScheduleListStore = _DeclarationScheduleListStoreBase
    with _$DeclarationScheduleListStore;

abstract class _DeclarationScheduleListStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final declarationScheduleController =
      Modular.get<DeclarationScheduleController>();
  @observable
  UsuarioLogadoModel? usuario;
  @observable
  List<DeclaracaoComparecimentoModel> listaDeclaracoes = [];
  @observable
  bool isLoading = true;
  @observable
  String? generatedPdfFilePath;
  @observable
  String teste = "nome teste";
  @observable
  bool ePaciente = false;

  @action
  callPage(context) async {
    if (!loginController.tokenExpired(context)) {
      isLoading = true;
      await carregarDados();
      Modular.to.pushNamed('/declaration/schedule');
    }
  }

  @action
  carregarDados() async {
    try {
      isLoading = true;
      usuario = Settings.usuario;
      listaDeclaracoes = [];
      final result = await declarationScheduleController.getData(usuario);
      listaDeclaracoes = result;
      isLoading = false;
      return listaDeclaracoes;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados',
        error: ex.toString(),
      );
      return null;
    }
  }

  avaliarDeclaracao(
    context,
    ePaciente,
    DeclaracaoComparecimentoModel declaracaoEscolhida,
  ) {
    final statementAttendanceStore = Modular.get<StatementAttendanceStore>();
    final alertDeclarationList = AlertDeclarationSchedule();
    if (ePaciente) {
      if (declaracaoEscolhida.dataHoraEntradaPaciente == null ||
          declaracaoEscolhida.dataHoraSaidaPaciente == null ||
          declaracaoEscolhida.codigoAtendimento == null ||
          declaracaoEscolhida.paciente == null ||
          (declaracaoEscolhida.paciente != null &&
              declaracaoEscolhida.paciente!.prontuario == null) ||
          (declaracaoEscolhida.paciente != null &&
              declaracaoEscolhida.paciente!.numeroCpf == null) ||
          (declaracaoEscolhida.paciente != null &&
              declaracaoEscolhida.paciente!.nomePaciente == null)) {
        return alertDeclarationList.showAlertDialog(
          context,
          "Dados incompletos para geração da declaração, contate o suporte!",
        );
      } else {
        statementAttendanceStore.callPage(ePaciente, declaracaoEscolhida);
      }
    } else {
      if (declaracaoEscolhida.dataHoraEntradaAcompanhante == null ||
          declaracaoEscolhida.dataHoraSaidaAcompanhante == null ||
          declaracaoEscolhida.codigoAtendimento == null ||
          declaracaoEscolhida.paciente == null ||
          declaracaoEscolhida.acompanhante == null ||
          (declaracaoEscolhida.acompanhante != null &&
              declaracaoEscolhida.acompanhante!.nomeAcompanhante == null) ||
          (declaracaoEscolhida.acompanhante != null &&
              declaracaoEscolhida.acompanhante!.numeroCpfAcompanhante ==
                  null) ||
          (declaracaoEscolhida.paciente != null &&
              declaracaoEscolhida.paciente!.nomePaciente == null)) {
        return alertDeclarationList.showAlertDialog(
          context,
          "Dados incompletos para geração da declaração, contate o suporte!",
        );
      } else {
        statementAttendanceStore.callPage(ePaciente, declaracaoEscolhida);
      }
    }
  }
}
