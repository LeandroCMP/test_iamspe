import 'package:iamspeapp/models/beneficiario.model.dart';
import 'package:iamspeapp/models/dados-perfil/email.model.dart';
import 'package:iamspeapp/models/dados-perfil/endereco.model.dart';
import 'package:iamspeapp/models/dados-perfil/telefone.model.dart';

class ContribuinteEditarModel {
  BeneficiarioModel? beneficiario;
  List<EnderecoModel>? enderecos;
  List<TelefoneModel>? telefones;
  List<EmailModel>? emails;

  ContribuinteEditarModel({
    this.beneficiario,
    this.enderecos,
    this.telefones,
    this.emails,
  });

  factory ContribuinteEditarModel.fromJson(Map<String, dynamic> json) {
    return ContribuinteEditarModel(
      beneficiario: json['beneficiario'] != null
          ? BeneficiarioModel.fromJson(json['beneficiario'])
          : null,
      emails: json['emails'] != null
          ? (json['emails'] as List).map((i) => EmailModel.fromJson(i)).toList()
          : [],
      enderecos: json['enderecos'] != null
          ? (json['enderecos'] as List)
              .map((i) => EnderecoModel.fromJson(i))
              .toList()
          : [],
      telefones: json['telefones'] != null
          ? (json['telefones'] as List)
              .map((i) => TelefoneModel.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['beneficiario'] = beneficiario!.toJson();
    data['emails'] = emails!.toList();
    data['enderecos'] = enderecos!.toList();
    data['telefones'] = telefones!.toList();
    return data;
  }
}
