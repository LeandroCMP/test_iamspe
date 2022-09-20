import 'dart:developer' as dev;
import 'package:iamspeapp/alerts/alert_escorts.dart';
import 'package:iamspeapp/app/repositories/escort/escort_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';

class InsertEscortController {
  AlertScorts alertEscorts = AlertScorts();
  insertEscort(
    context, {
    user,
    name,
    cpf,
    email,
    chart,
  }) async {
    AcompanhanteModel acompanhanteAlteracao = AcompanhanteModel();
    acompanhanteAlteracao.nomeAcompanhante = name.toUpperCase();
    acompanhanteAlteracao.numeroCpfAcompanhante = cpf;
    acompanhanteAlteracao.emailAcompanhante = email;
    acompanhanteAlteracao.codigoPaciente = chart;
    var repository = EscortRepositoryImpl();
    final response = await repository.postEscort(
      acompanhanteAlteracao,
      user.token,
    );
    if (response == true) {
      alertEscorts.showDialogEscortUpdate(
        context,
        "Acompanhante cadastrado com sucesso!",
        false,
      );
    } else {
      alertEscorts.showDialogEscortUpdate(
        context,
        "response.data['message'].toString()",
        true,
      );
    }
    return response;
  }

  updateEscort(
    context,
    AcompanhanteModel acompanhante,
    name,
    cpf,
    email,
    prontuario,
  ) async {
    try {
      final usuario = Settings.usuario;
      AcompanhanteModel acompanhanteAlteracao = AcompanhanteModel();
      acompanhanteAlteracao.codigoAcompanhante =
          acompanhante.codigoAcompanhante;
      acompanhanteAlteracao.ativo = acompanhante.ativo;
      acompanhanteAlteracao.nomeAcompanhante = name;
      acompanhanteAlteracao.numeroCpfAcompanhante = cpf;
      acompanhanteAlteracao.emailAcompanhante = email;
      acompanhanteAlteracao.codigoPaciente = prontuario;
      var repository = EscortRepositoryImpl();
      var result = await repository.putEscort(
        acompanhanteAlteracao,
        usuario!.token!,
      );
      if (result != null) {
        alertEscorts.showDialogEscortUpdate(
          context,
          "Acompanhante atualizado com sucesso!",
          false,
        );
      } else {
        alertEscorts.showDialogEscortUpdate(
          context,
          "Erro ao atualizar acompanhante, tente novamente mais tarde",
          true,
        );
      }
      return false;
    } catch (e) {
      alertEscorts.showDialogEscortUpdate(
        context,
        "Ocorreu um erro inesperado, por favor, tente mais tarde.",
        true,
      );
      dev.log(
        'Erro de exception ao alterar dados do acompanhante',
        error: e.toString(),
      );
      return true;
    }
  }
}
