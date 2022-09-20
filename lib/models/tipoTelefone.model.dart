class TipoTelefoneModel {
  String? idTipoTelefone;
  String? descTipoTelefone;

  TipoTelefoneModel({
    this.idTipoTelefone,
    this.descTipoTelefone,
  });

  factory TipoTelefoneModel.fromJson(Map<String, dynamic> json) {
    return TipoTelefoneModel(
      idTipoTelefone: json['idTipoTelefone'] ?? '',
      descTipoTelefone: json['descTipoTelefone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTipoTelefone'] = idTipoTelefone;
    data['descTipoTelefone'] = descTipoTelefone;
    return data;
  }
}
