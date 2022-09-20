class TipoBeneficioModel {
  String? idTipoBeneficio;
  String? descTipoBeneficio;

  TipoBeneficioModel({this.idTipoBeneficio, this.descTipoBeneficio});

  factory TipoBeneficioModel.fromJson(Map<String, dynamic> json) {
    return TipoBeneficioModel(
      idTipoBeneficio: json['idTipoBeneficio'],
      descTipoBeneficio: json['descTipoBeneficio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTipoBeneficio'] = idTipoBeneficio;
    data['descTipoBeneficio'] = descTipoBeneficio;
    return data;
  }
}
