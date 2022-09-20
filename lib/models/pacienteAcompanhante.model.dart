import 'package:iamspeapp/models/acompanhante.model.dart';

class PacienteAcompanhanteModel {
  String? idBeneficiario;
  int? prontuario;
  String? nomePaciente;
  String? tipoSexo;
  String? numeroCpf;
  String? nomeMae;
  String? nomePai;
  String? endereco;
  List<AcompanhanteModel>? acompanhantes;
  String? qrCode;

  PacienteAcompanhanteModel(
      {this.idBeneficiario,
      this.prontuario,
      this.nomePaciente,
      this.tipoSexo,
      this.numeroCpf,
      this.nomeMae,
      this.nomePai,
      this.endereco,
      this.acompanhantes,
      this.qrCode});

  factory PacienteAcompanhanteModel.fromJson(Map<String, dynamic> json) {
    return PacienteAcompanhanteModel(
      idBeneficiario: json['idBeneficiario'],
      prontuario: json['prontuario'],
      nomePaciente: json['nomePaciente'],
      tipoSexo: json['tipoSexo'],
      numeroCpf: json['numeroCpf'],
      nomeMae: json['nomeMae'],
      nomePai: json['nomePai'],
      endereco: json['endereco'],
      acompanhantes: json['acompanhantes'] != null
          ? (json['acompanhantes'] as List)
              .map(
                (i) => AcompanhanteModel.fromJson(i),
              )
              .toList()
          : [],
      qrCode: json['qrCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idBeneficiario'] = idBeneficiario;
    data['prontuario'] = prontuario;
    data['nomePaciente'] = nomePaciente;
    data['tipoSexo'] = tipoSexo;
    data['numeroCpf'] = numeroCpf;
    data['nomeMae'] = nomeMae;
    data['nomePai'] = nomePai;
    data['endereco'] = endereco;
    data['acompanhantes'] = acompanhantes!.toList();
    data['qrCode'] = qrCode;
    return data;
  }
}
