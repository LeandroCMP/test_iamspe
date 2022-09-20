class CredenciadosModel {
  var especialidade;
  var segmentacao;
  var tipologia;
  var municipio;
  var uf;
  var unid_neg;
  var cod_prest;
  var nome_credenciado;
  var tipo_logr;
  var logradouro;
  var numero;
  var compl;
  var bairro;
  var cep;
  var ddd;
  var telefone;
  var segmentacao_id;
  var tipologia_id;
  var unid_neg_id;
  var especialidade_id;
  var municipio_id;
  var tipologia_grupo;
  var segmentacao_grupo;

  CredenciadosModel(
      {this.especialidade,
      this.segmentacao,
      this.tipologia,
      this.municipio,
      this.uf,
      this.unid_neg,
      this.cod_prest,
      this.nome_credenciado,
      this.tipo_logr,
      this.logradouro,
      this.numero,
      this.compl,
      this.bairro,
      this.cep,
      this.ddd,
      this.telefone,
      this.segmentacao_id,
      this.tipologia_id,
      this.unid_neg_id,
      this.especialidade_id,
      this.municipio_id,
      this.tipologia_grupo,
      this.segmentacao_grupo});

  factory CredenciadosModel.fromJson(Map<String, dynamic> json) {
    return CredenciadosModel(
      especialidade: json['ESPECIALIDADE'],
      segmentacao: json['SEGMENTACAO'],
      tipologia: json['TIPOLOGIA'],
      municipio: json['MUNICIPIO'],
      uf: json['UF'],
      unid_neg: json['UNID_NEG'],
      cod_prest: json['COD_PREST'],
      nome_credenciado: json['NOME_CREDENCIADO'],
      tipo_logr: json['TIPO_LOGR'],
      logradouro: json['LOGRADOURO'],
      numero: json['NUMERO'],
      compl: json['COMPL'],
      bairro: json['BAIRRO'],
      cep: json['CEP'],
      ddd: json['DDD'],
      telefone: json['TELEFONE'],
      segmentacao_id: json['segmentacao_id'],
      tipologia_id: json['tipologia_id'],
      unid_neg_id: json['unid_neg_id'],
      especialidade_id: json['especialidade_id'],
      municipio_id: json['municipio_id'],
      tipologia_grupo: json['tipologia_grupo'],
      segmentacao_grupo: json['segmentacao_grupo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ESPECIALIDADE'] = especialidade;
    data['SEGMENTACAO'] = segmentacao;
    data['TIPOLOGIA'] = tipologia;
    data['MUNICIPIO'] = municipio;
    data['UF'] = uf;
    data['UNID_NEG'] = unid_neg;
    data['COD_PREST'] = cod_prest;
    data['NOME_CREDENCIADO'] = nome_credenciado;
    data['TIPO_LOGR'] = tipo_logr;
    data['LOGRADOURO'] = logradouro;
    data['NUMERO'] = numero;
    data['COMPL'] = compl;
    data['BAIRRO'] = bairro;
    data['CEP'] = cep;
    data['DDD'] = ddd;
    data['TELEFONE'] = telefone;
    data['segmentacao_id'] = segmentacao_id;
    data['tipologia_id'] = tipologia_id;
    data['unid_neg_id'] = unid_neg_id;
    data['especialidade_id'] = especialidade_id;
    data['municipio_id'] = municipio_id;
    data['tipologia_grupo'] = tipologia_grupo;
    data['segmentacao_grupo'] = segmentacao_grupo;
    return data;
  }
}
