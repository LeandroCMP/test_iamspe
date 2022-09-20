class RetornoAtendimentoModel {
  int? status;
  String? mensagem;
  int? idAtendimento;

  RetornoAtendimentoModel({
    this.status,
    this.mensagem,
    this.idAtendimento,
  });

  factory RetornoAtendimentoModel.fromJson(Map<String, dynamic> json) {
    return RetornoAtendimentoModel(
      status: json['status'],
      mensagem: json['mensagem'],
      idAtendimento: json['idAtendimento'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['mensagem'] = mensagem;
    data['idAtendimento'] = idAtendimento;
    return data;
  }
}
