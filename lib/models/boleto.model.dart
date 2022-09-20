import 'package:iamspeapp/models/lanctoFinanc.model.dart';

class BoletoModel {
  String? idTitulo;
  String? dataVencimento;
  String? dataVencimentoNova;
  double? valorTitulo;
  double? valorMulta;
  int? nossoNumero;
  List? listTitulo;
  LanctoBeneficioModel? lanctoFinanc;

  BoletoModel(
      {this.idTitulo,
      this.dataVencimento,
      this.dataVencimentoNova,
      this.valorTitulo,
      this.valorMulta,
      this.nossoNumero,
      this.listTitulo,
      this.lanctoFinanc});

  factory BoletoModel.fromJson(Map<String, dynamic> json) {
    return BoletoModel(
      idTitulo: json['idTitulo'],
      dataVencimento: json['dataVencimento'],
      dataVencimentoNova: json['dataVencimentoNova'],
      valorTitulo: json['valorTitulo'],
      valorMulta: json['valorMulta'],
      nossoNumero: json['nossoNumero'],
      listTitulo: json['listTitulo'],
      lanctoFinanc: LanctoBeneficioModel.fromJson(json['lanctoFinanc']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTitulo'] = idTitulo;
    data['dataVencimento'] = dataVencimento;
    data['dataVencimentoNova'] = dataVencimentoNova;
    data['valorTitulo'] = valorTitulo;
    data['valorMulta'] = valorMulta;
    data['nossoNumero'] = nossoNumero;
    data['listTitulo'] = listTitulo;
    data['lanctoFinanc'] = lanctoFinanc!.toJson();
    return data;
  }
}

class LanctoFinanc {}
