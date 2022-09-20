import 'package:iamspeapp/models/vinculoPessoal.model.dart';

import 'cadastroBenefic.model.dart';

class UsuarioLogadoModel {
  String? idUsuario;
  String? idBeneficiario;
  String? idTitular;
  String? nome;
  int? nivel;
  String? cpf;
  String? dataNascimento;
  String? email;
  int? cadOrgao;
  int? cadUnidDesp;
  int? cadUnidOrc;
  int? codigoOperadorSistema;
  String? carteira;
  CadastroBeneficModel? cadBeneficiario;
  String? authorization;
  String? nomeMae;
  String? token;
  VinculoPessoalModel? vinculoPessoal;
  String? exp;

  UsuarioLogadoModel({
    this.idUsuario,
    this.nome,
    this.idBeneficiario,
    this.idTitular,
    this.authorization,
    this.nivel,
    this.cadOrgao,
    this.cpf,
    this.dataNascimento,
    this.email,
    this.cadUnidDesp,
    this.cadUnidOrc,
    this.codigoOperadorSistema,
    this.carteira,
    this.cadBeneficiario,
    this.nomeMae,
    this.token,
    this.vinculoPessoal,
    this.exp,
  });

  factory UsuarioLogadoModel.fromJson(Map<String, dynamic> json) {
    return UsuarioLogadoModel(
        idUsuario: json['idUsuario'],
        nome: json['nome'],
        authorization: json['authorization'],
        idBeneficiario: json['idBeneficiario'],
        idTitular: json['idTitular'],
        nivel: json['nivel'],
        cadOrgao: json['cadOrgao'],
        cpf: json['cpf'],
        dataNascimento: json['dataNascimento'],
        email: json['email'],
        cadUnidDesp: json['cadUnidDesp'],
        cadUnidOrc: json['cadUnidOrc'],
        codigoOperadorSistema: json['codigoOperadorSistema'],
        carteira: json['carteira'],
        cadBeneficiario: json['cadBeneficiario'] != null
            ? CadastroBeneficModel.fromJson(json['cadBeneficiario'])
            : null,
        nomeMae: json['nomeMae'],
        token: json['token'],
        vinculoPessoal: json['vinculoPessoal'] != null
            ? VinculoPessoalModel.fromJson(json['vinculoPessoal'])
            : null,
        exp: json['exp']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUsuario'] = idUsuario;
    data['nome'] = nome;
    data['authorization'] = authorization;
    data['idBeneficiario'] = idBeneficiario;
    data['idTitular'] = idTitular;
    data['nivel'] = nivel;
    data['cadOrgao'] = cadOrgao;
    data['cpf'] = cpf;
    data['dataNascimento'] = dataNascimento;
    data['email'] = email;
    data['cadUnidDesp'] = cadUnidDesp;
    data['cadUnidOrc'] = cadUnidOrc;
    data['codigoOperadorSistema'] = codigoOperadorSistema;
    data['carteira'] = carteira;
    data['cadBeneficiario'] = cadBeneficiario!.toJson();
    data['nomeMae'] = nomeMae;
    data['token'] = token;
    data['vinculoPessoal'] = vinculoPessoal!.toJson();
    data['exp'] = exp;
    return data;
  }
}

class UsuarioAutenticacaoModel {
  String? login;
  String? senha;

  UsuarioAutenticacaoModel({this.login, this.senha});

  UsuarioAutenticacaoModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['senha'] = senha;
    return data;
  }
}

class UsuarioTokenModel {
  String? token;
  String? expiresIn;

  UsuarioTokenModel({this.token, this.expiresIn});

  factory UsuarioTokenModel.fromJson(Map<String, dynamic> json) {
    return UsuarioTokenModel(
        token: json['token'], expiresIn: json['expiresIn']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiresIn'] = expiresIn;
    return data;
  }
}

class EntradaInvalidaModel {
  int? status;
  String? message;

  EntradaInvalidaModel({this.status, this.message});

  factory EntradaInvalidaModel.fromJson(Map<String, dynamic> json) {
    return EntradaInvalidaModel(
        status: json['status'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
