class VinculoPessoalModel {
  String? idVinculoPessoal;
  String? descVinculo;

  VinculoPessoalModel({this.idVinculoPessoal, this.descVinculo});

  factory VinculoPessoalModel.fromJson(Map<String, dynamic> json) {
    return VinculoPessoalModel(
      idVinculoPessoal: json['idVinculoPessoal'] ?? '',
      descVinculo: json['descVinculo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idVinculoPessoal'] = idVinculoPessoal;
    data['descVinculo'] = descVinculo;
    return data;
  }
}
