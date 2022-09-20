class EnderecoModel {
  int? cep;
  String? tipoLogradouro;
  String? principal;
  String? logradouro;
  int? numero;
  String? complemento;
  var tipoEndereco;
  String? bairro;
  String? siglaUf;
  String? nomeCidade;

  EnderecoModel({
    this.cep,
    this.tipoLogradouro,
    this.principal,
    this.logradouro,
    this.numero,
    this.complemento,
    this.tipoEndereco,
    this.bairro,
    this.siglaUf,
    this.nomeCidade,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
      cep: json['cep'] ?? '',
      tipoLogradouro: json['tipoLogradouro'] ?? '',
      principal: json['principal'] ?? '',
      logradouro: json['logradouro'] ?? '',
      numero: json['numero'] ?? '',
      complemento: json['complemento'] ?? '',
      tipoEndereco: json['tipoEndereco'] ?? '',
      bairro: json['bairro'] ?? '',
      siglaUf: json['siglaUf'] ?? '',
      nomeCidade: json['nomeCidade'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['tipoLogradouro'] = tipoLogradouro;
    data['principal'] = principal;
    data['logradouro'] = logradouro;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['tipoEndereco'] = tipoEndereco;
    data['bairro'] = bairro;
    data['siglaUf'] = siglaUf;
    data['nomeCidade'] = nomeCidade;
    return data;
  }
}
