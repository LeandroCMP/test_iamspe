class EspecialidadesModel {
  int? especialidade_id;
  String? especialidade;
  int? qtde_prestadores;
  int? tipologia_grupo;
  int? segmentacao_grupo;

  EspecialidadesModel({
    this.especialidade_id,
    this.especialidade,
    this.qtde_prestadores,
    this.tipologia_grupo,
    this.segmentacao_grupo,
  });

  factory EspecialidadesModel.fromJson(Map<String, dynamic> json) {
    return EspecialidadesModel(
      especialidade_id: json['especialidade_id'],
      especialidade: json['especialidade'],
      qtde_prestadores: json['qtde_prestadores'],
      tipologia_grupo: json['tipologia_grupo'],
      segmentacao_grupo: json['segmentacao_grupo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['especialidade_id'] = especialidade_id;
    data['especialidade'] = especialidade;
    data['qtde_prestadores'] = qtde_prestadores;
    data['tipologia_grupo'] = tipologia_grupo;
    data['segmentacao_grupo'] = segmentacao_grupo;
    return data;
  }
}
