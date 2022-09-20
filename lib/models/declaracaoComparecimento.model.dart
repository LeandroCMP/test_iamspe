import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';
import 'package:intl/intl.dart';

class DeclaracaoComparecimentoModel {
  int? codigoEntrada;
  int? codigoAtendimento;
  int? codigoPaciente;
  String? carteira;
  int? codigoAcompanhante;
  var dataHoraEntradaPaciente;
  var dataHoraSaidaPaciente;
  var dataHoraEntradaAcompanhante;
  var dataHoraSaidaAcompanhante;
  AcompanhanteModel? acompanhante;
  PacienteAcompanhanteModel? paciente;
  String? tokenAcesso;
  int? cdDesbloqueio;
  String? qrCodeToken;

  DeclaracaoComparecimentoModel(
      {this.codigoPaciente,
      this.codigoEntrada,
      this.codigoAtendimento,
      this.carteira,
      this.codigoAcompanhante,
      this.dataHoraEntradaPaciente,
      this.dataHoraEntradaAcompanhante,
      this.dataHoraSaidaPaciente,
      this.dataHoraSaidaAcompanhante,
      this.acompanhante,
      this.paciente,
      this.tokenAcesso,
      this.cdDesbloqueio,
      this.qrCodeToken});

  factory DeclaracaoComparecimentoModel.fromJson(Map<String, dynamic> json) {
    return DeclaracaoComparecimentoModel(
      codigoPaciente: json['codigoPaciente'],
      codigoEntrada: json['codigoEntrada'],
      codigoAtendimento: json['codigoAtendimento'],
      carteira: json['carteira'],
      codigoAcompanhante: json['codigoAcompanhante'],
      dataHoraSaidaPaciente: json['dataHoraSaidaPaciente'] != null
          ? DateFormat('dd/MM/yyyy HH:mm').format(
              DateTime.parse(json['dataHoraSaidaPaciente'].split('.')[0]))
          : null,
      dataHoraSaidaAcompanhante: json['dataHoraSaidaAcompanhante'] != null
          ? DateFormat('dd/MM/yyyy HH:mm').format(
              DateTime.parse(json['dataHoraSaidaAcompanhante'].split('.')[0]))
          : null,
      dataHoraEntradaPaciente: json['dataHoraEntradaPaciente'],
      dataHoraEntradaAcompanhante: json['dataHoraEntradaAcompanhante'] != null
          ? DateFormat('dd/MM/yyyy HH:mm').format(
              DateTime.parse(json['dataHoraEntradaAcompanhante'].split('.')[0]))
          : null,
      acompanhante: json['acompanhante'] != null
          ? AcompanhanteModel.fromJson(json['acompanhante'])
          : null,
      paciente: json['paciente'] != null
          ? PacienteAcompanhanteModel.fromJson(json['paciente'])
          : null,
      tokenAcesso: json['tokenAcesso'],
      cdDesbloqueio: json['cdDesbloqueio'],
      qrCodeToken: json['qrCodeToken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigoPaciente'] = codigoPaciente;
    data['codigoEntrada'] = codigoEntrada;
    data['codigoAtendimento'] = codigoAtendimento;
    data['carteira'] = carteira;
    data['codigoAcompanhante'] = codigoAcompanhante;
    data['dataHoraSaidaPaciente'] = dataHoraSaidaPaciente;
    data['dataHoraSaidaAcompanhante'] = dataHoraSaidaAcompanhante;
    data['dataHoraEntradaPaciente'] = dataHoraEntradaPaciente;
    data['dataHoraEntradaAcompanhante'] = dataHoraEntradaAcompanhante;
    data['acompanhante'] = acompanhante!.toJson();
    data['paciente'] = paciente!.toJson();
    data['tokenAcesso'] = tokenAcesso;
    data['cdDesbloqueio'] = cdDesbloqueio;
    data['qrCodeToken'] = qrCodeToken;
    return data;
  }
}
