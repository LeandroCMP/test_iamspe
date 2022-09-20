import 'package:iamspeapp/models/statusBeneficiario.model.dart';
import 'package:iamspeapp/models/vinculoPessoal.model.dart';

class BeneficiarioModel {
  String? idBeneficiario;
  String? idTitular;
  String? nome;
  int? sexo;
  int? estadoCivil;
  String? cpf;
  String? nomeMae;
  String? dataNascimento;
  String? rg;
  String? carteira;
  String? digitoCarteira;
  VinculoPessoalModel? vinculoPessoal;
  StatusBeneficiarioModel? statusBen;

  BeneficiarioModel(
      {this.idBeneficiario,
      this.idTitular,
      this.nome,
      this.sexo,
      this.estadoCivil,
      this.cpf,
      this.nomeMae,
      this.dataNascimento,
      this.rg,
      this.carteira,
      this.digitoCarteira,
      this.vinculoPessoal,
      this.statusBen});

  factory BeneficiarioModel.fromJson(Map<String, dynamic> json) {
    return BeneficiarioModel(
      idBeneficiario: json['idBeneficiario'] ?? '',
      idTitular: json['idTitular'] ?? '',
      nome: json['nome'] ?? '',
      sexo: json['sexo'] ?? '',
      estadoCivil: json['estadoCivil'] ?? '',
      cpf: json['cpf'] ?? '',
      nomeMae: json['nomeMae'] ?? '',
      dataNascimento: json['dataNascimento'] ?? '',
      rg: json['rg'] ?? '',
      carteira: json['carteira'] ?? '',
      digitoCarteira: json['digitoCarteira'] ?? '',
      vinculoPessoal: json['vinculoPessoal'] != null
          ? VinculoPessoalModel.fromJson(json['vinculoPessoal'])
          : null,
      statusBen: json['statusBen'] != null
          ? StatusBeneficiarioModel.fromJson(json['statusBen'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idBeneficiario'] = idBeneficiario;
    data['idTitular'] = idTitular;
    data['nome'] = nome;
    data['sexo'] = sexo;
    data['estadoCivil'] = estadoCivil;
    data['cpf'] = cpf;
    data['nomeMae'] = nomeMae;
    data['dataNascimento'] = dataNascimento;
    data['rg'] = rg;
    data['carteira'] = carteira;
    data['digitoCarteira'] = digitoCarteira;
    data['vinculoPessoal'] = vinculoPessoal!.toJson();
    data['statusBen'] = statusBen!.toJson();
    return data;
  }
}
