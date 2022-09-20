class PrestadorModel {
  int? idPrestador;
  String? nomePrestador;

  PrestadorModel({
    this.idPrestador,
    this.nomePrestador,
  });

  factory PrestadorModel.fromJson(Map<String, dynamic> json) {
    return PrestadorModel(
      idPrestador: json['idPrestador'],
      nomePrestador: json['nomePrestador'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPrestador'] = idPrestador;
    data['nomePrestador'] = nomePrestador;
    return data;
  }
}
