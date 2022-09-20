class ItemConfigTempoModel {
  int? idItem;
  String? dsItem;
  String? tpItem;
  int? tempoIni;
  int? tempoFim;
  int? giroAcompanhante;

  ItemConfigTempoModel(
      {this.idItem,
      this.dsItem,
      this.tpItem,
      this.tempoIni,
      this.tempoFim,
      this.giroAcompanhante});

  factory ItemConfigTempoModel.fromJson(Map<String, dynamic> json) {
    return ItemConfigTempoModel(
      idItem: json['idItem'],
      dsItem: json['dsItem'],
      tpItem: json['tpItem'],
      tempoIni: json['tempoIni'],
      tempoFim: json['tempoFim'],
      giroAcompanhante: json['giroAcompanhante'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idItem'] = idItem;
    data['dsItem'] = dsItem;
    data['tpItem'] = tpItem;
    data['giroAcompanhante'] = giroAcompanhante;
    data['tempoIni'] = tempoIni;
    data['tempoFim'] = tempoFim;
    return data;
  }
}
