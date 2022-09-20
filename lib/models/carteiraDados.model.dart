import 'package:iamspeapp/models/vinculoPessoal.model.dart';

class CarteiraDadosModel {
  String? idBeneficiario;
  String? nome;
  String? rg;
  String? cpf;
  String? dataNascimento;
  String? carteira;
  String? digitoCarteira;
  VinculoPessoalModel? vinculoPessoal;

  CarteiraDadosModel({
    this.idBeneficiario,
    this.nome,
    this.rg,
    this.cpf,
    this.dataNascimento,
    this.carteira,
    this.digitoCarteira,
    this.vinculoPessoal,
  });

  factory CarteiraDadosModel.fromJson(Map<String, dynamic> json) {
    VinculoPessoalModel vinculo =
        VinculoPessoalModel.fromJson(json['vinculoPessoal']);

    return CarteiraDadosModel(
      idBeneficiario: json['idBeneficiario'],
      nome: json['nome'],
      rg: json['rg'],
      cpf: json['cpf'],
      dataNascimento: json['dataNascimento'],
      carteira: json['carteira'],
      digitoCarteira: json['digitoCarteira'],
      vinculoPessoal: vinculo,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idBeneficiario'] = idBeneficiario;
    data['nome'] = nome;
    data['rg'] = rg;
    data['cpf'] = cpf;
    data['dataNascimento'] = dataNascimento;
    data['carteira'] = carteira;
    data['digitoCarteira'] = digitoCarteira;
    data['vinculoPessoal'] = vinculoPessoal!.toJson();
    return data;
  }
}
