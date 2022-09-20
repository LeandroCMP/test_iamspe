class UnidadeAtendimentoModel {
  int? idUnidadeAtendimento;
  String? descricao;
  String? enderecoLocalAtendimento;

  UnidadeAtendimentoModel(
      {this.idUnidadeAtendimento,
      this.descricao,
      this.enderecoLocalAtendimento});

  factory UnidadeAtendimentoModel.fromJson(Map<String, dynamic> json) {
    return UnidadeAtendimentoModel(
      idUnidadeAtendimento: json['idUnidadeAtendimento'] ?? '',
      descricao: json['descricao'] ?? '',
      enderecoLocalAtendimento: json['enderecoLocalAtendimento'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUnidadeAtendimento'] = idUnidadeAtendimento;
    data['descricao'] = descricao;
    data['enderecoLocalAtendimento'] = enderecoLocalAtendimento;
    return data;
  }
}
