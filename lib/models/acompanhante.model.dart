import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';

class AcompanhanteModel {
  int? codigoPaciente;
  String? nomeAcompanhante;
  String? numeroCpfAcompanhante;
  String? emailAcompanhante;
  int? codigoAcompanhante;
  String? dataCadastroAcompanhante;
  String? dataExclusaoAcompanhante;
  bool? ativo;
  String? qrCode;
  PacienteAcompanhanteModel? paciente;
  String? dataAtualizacaoAcompanhante;

  AcompanhanteModel({
    this.codigoPaciente,
    this.nomeAcompanhante,
    this.numeroCpfAcompanhante,
    this.emailAcompanhante,
    this.codigoAcompanhante,
    this.dataCadastroAcompanhante,
    this.dataExclusaoAcompanhante,
    this.ativo,
    this.qrCode,
    this.paciente,
    this.dataAtualizacaoAcompanhante,
  });

  factory AcompanhanteModel.fromJson(Map<String, dynamic> json) {
    return AcompanhanteModel(
      codigoPaciente: json['codigoPaciente'],
      nomeAcompanhante: json['nomeAcompanhante'],
      numeroCpfAcompanhante: json['numeroCpfAcompanhante'],
      emailAcompanhante: json['emailAcompanhante'],
      codigoAcompanhante: json['codigoAcompanhante'],
      ativo: json['ativo'] ?? false,
      qrCode: json['qrCode'],
      dataCadastroAcompanhante: json['dataCadastroAcompanhante'],
      dataExclusaoAcompanhante: json['dataExclusaoAcompanhante'],
      paciente: json['paciente'] != null
          ? PacienteAcompanhanteModel.fromJson(json['paciente'])
          : null,
      dataAtualizacaoAcompanhante: json['dataAtualizacaoAcompanhante'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigoPaciente'] = codigoPaciente;
    data['nomeAcompanhante'] = nomeAcompanhante;
    data['numeroCpfAcompanhante'] = numeroCpfAcompanhante;
    data['emailAcompanhante'] = emailAcompanhante;
    data['codigoAcompanhante'] = codigoAcompanhante;
    data['ativo'] = ativo ?? true;
    data['qrCode'] = qrCode;
    data['dataCadastroAcompanhante'] = dataCadastroAcompanhante;
    data['dataExclusaoAcompanhante'] = dataExclusaoAcompanhante;
    // ignore: prefer_null_aware_operators
    data['paciente'] = paciente != null ? paciente!.toJson() : null;
    data['dataAtualizacaoAcompanhante'] = dataAtualizacaoAcompanhante;
    return data;
  }
}
