import 'package:iamspeapp/models/beneficiario.model.dart';

class DeclaracaoRendaModel {
  String? idDmed;
  String? exercicio;
  String? calendario;
  String? assinatura;
  String? valorTotal;
  String? valorExtenso;
  List? listaContribuicao;
  BeneficiarioModel? beneficiario;

  DeclaracaoRendaModel(
      {this.idDmed,
      this.exercicio,
      this.calendario,
      this.assinatura,
      this.valorTotal,
      this.valorExtenso,
      this.listaContribuicao,
      this.beneficiario});

  factory DeclaracaoRendaModel.fromJson(Map<String, dynamic> json) {
    return DeclaracaoRendaModel(
      idDmed: json['idDmed'],
      exercicio: json['exercicio'],
      calendario: json['calendario'],
      assinatura: json['assinatura'],
      valorTotal: json['valorTotal'],
      valorExtenso: json['valorExtenso'],
      listaContribuicao: json['listaContribuicao'],
      beneficiario: BeneficiarioModel.fromJson(json['beneficiario']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idDmed'] = idDmed;
    data['exercicio'] = exercicio;
    data['calendario'] = calendario;
    data['assinatura'] = assinatura;
    data['valorTotal'] = valorTotal;
    data['valorExtenso'] = valorExtenso;
    data['listaContribuicao'] = listaContribuicao;
    data['beneficiario'] = beneficiario!.toJson();
    return data;
  }
}

class LanctoFinanc {}
