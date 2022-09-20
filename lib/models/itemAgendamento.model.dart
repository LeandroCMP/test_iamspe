import 'package:iamspeapp/models/itemConfigTempo.model.dart';

class ItemAgendamentoModel {
  int? idItemAgendamento;
  String? descricao;
  ItemConfigTempoModel? itemConfigTempo;

  ItemAgendamentoModel(
      {this.idItemAgendamento, this.descricao, this.itemConfigTempo});

  factory ItemAgendamentoModel.fromJson(Map<String, dynamic> json) {
    return ItemAgendamentoModel(
      idItemAgendamento: json['idItemAgendamento'],
      descricao: json['descricao'],
      itemConfigTempo: json['itemConfigTempo'] != null
          ? ItemConfigTempoModel.fromJson(json['itemConfigTempo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idItemAgendamento'] = idItemAgendamento;
    data['descricao'] = descricao;
    return data;
  }
}
