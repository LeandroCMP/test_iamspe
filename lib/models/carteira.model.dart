import 'package:iamspeapp/models/statusBeneficiario.model.dart';
import 'package:iamspeapp/models/vinculoPessoal.model.dart';

class CarteiraModel {
  String? idBeneficiario;
  String? idTitular;
  String? nome;
  int? sexo;
  int? estadoCivil;
  String? cpf;
  String? dataNascimento;
  String? carteira;
  VinculoPessoalModel? vinculoPessoal;
  StatusBeneficiarioModel? statusBen;

  CarteiraModel(
      {this.idBeneficiario,
      this.nome,
      this.sexo,
      this.estadoCivil,
      this.cpf,
      this.dataNascimento,
      this.carteira,
      this.idTitular,
      this.vinculoPessoal,
      this.statusBen});

  factory CarteiraModel.fromJson(Map<String, dynamic> json) {
    VinculoPessoalModel vinculo =
        VinculoPessoalModel.fromJson(json['vinculoPessoal']);
    StatusBeneficiarioModel status =
        StatusBeneficiarioModel.fromJson(json['statusBen']);

    return CarteiraModel(
        idBeneficiario: json['idBeneficiario'],
        idTitular: json['idTitular'],
        nome: json['nome'],
        sexo: json['sexo'],
        estadoCivil: json['estadoCivil'],
        cpf: json['cpf'],
        dataNascimento: json['dataNascimento'],
        carteira: json['carteira'],
        vinculoPessoal: vinculo,
        statusBen: status);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idBeneficiario'] = idBeneficiario;
    data['idTitular'] = idTitular;
    data['nome'] = nome;
    data['sexo'] = sexo;
    data['estadoCivil'] = estadoCivil;
    data['cpf'] = cpf;
    data['dataNascimento'] = dataNascimento;
    data['carteira'] = carteira;
    data['vinculoPessoal'] = vinculoPessoal!.toJson();
    data['statusBen'] = statusBen!.toJson();
    return data;
  }
}
