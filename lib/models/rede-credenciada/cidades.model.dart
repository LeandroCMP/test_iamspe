class CidadesModel {
  int? municipio_id;
  String? municipio;
  int? qtde_prestadores;
  int? tipologia_grupo;
  int? segmentacao_grupo;

  CidadesModel({
    this.municipio_id,
    this.municipio,
    this.qtde_prestadores,
    this.tipologia_grupo,
    this.segmentacao_grupo,
  });

  factory CidadesModel.fromJson(Map<String, dynamic> json) {
    return CidadesModel(
      municipio_id: json['municipio_id'],
      municipio: json['municipio'],
      qtde_prestadores: json['qtde_prestadores'],
      tipologia_grupo: json['tipologia_grupo'],
      segmentacao_grupo: json['segmentacao_grupo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['municipio_id'] = municipio_id;
    data['municipio'] = municipio;
    data['qtde_prestadores'] = qtde_prestadores;
    data['tipologia_grupo'] = tipologia_grupo;
    data['segmentacao_grupo'] = segmentacao_grupo;
    return data;
  }
}
