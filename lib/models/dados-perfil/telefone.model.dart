import 'package:iamspeapp/models/tipoTelefone.model.dart';

class TelefoneModel {
  String? idTelefone;
  int? ddd;
  String? snPrincipal;
  int? numero;
  TipoTelefoneModel? tipoTelefone;

  TelefoneModel({
    this.idTelefone,
    this.ddd,
    this.snPrincipal,
    this.numero,
    this.tipoTelefone,
  });

  factory TelefoneModel.fromJson(Map<String, dynamic> json) {
    TipoTelefoneModel tipo = TipoTelefoneModel.fromJson(json['tipoTelefone']);
    return TelefoneModel(
      idTelefone: json['idTelefone'] ?? '',
      ddd: json['ddd'] ?? '',
      snPrincipal: json['snPrincipal'] ?? '',
      numero: json['numero'] ?? '',
      tipoTelefone: tipo,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTelefone'] = idTelefone;
    data['ddd'] = ddd;
    data['snPrincipal'] = snPrincipal;
    data['numero'] = numero;
    data['tipoTelefone'] = tipoTelefone!.toJson();
    return data;
  }
}
