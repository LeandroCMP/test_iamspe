import 'package:iamspeapp/models/tipoBeneficio.model.dart';

class LanctoBeneficioModel {
  String? tipoInclusao;
  String? tipoCobranca;
  String? tipoGeracao;
  TipoBeneficioModel? tipoBeneficio;

  LanctoBeneficioModel(
      {this.tipoInclusao,
      this.tipoCobranca,
      this.tipoGeracao,
      this.tipoBeneficio});

  factory LanctoBeneficioModel.fromJson(Map<String, dynamic> json) {
    TipoBeneficioModel tipoBen =
        TipoBeneficioModel.fromJson(json['tipoBeneficio']);

    return LanctoBeneficioModel(
        tipoInclusao: json['tipoInclusao'],
        tipoCobranca: json['tipoCobranca'],
        tipoGeracao: json['tipoGeracao'],
        tipoBeneficio: tipoBen);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tipoInclusao'] = tipoInclusao;
    data['tipoCobranca'] = tipoCobranca;
    data['tipoGeracao'] = tipoGeracao;
    data['tipoBeneficio'] = tipoBeneficio!.toJson();
    return data;
  }
}
