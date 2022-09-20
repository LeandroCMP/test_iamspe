import 'package:iamspeapp/models/itemAgendamento.model.dart';
import 'package:iamspeapp/models/prestador.model.dart';
import 'package:iamspeapp/models/unidadeAtendimento.model.dart';

class ItemAgendaModel {
  int? idItemAgenda;
  int? idAgenda;
  String? horaAgenda;
  String? snAtendido;
  ItemAgendamentoModel? itemAgendamento;
  PrestadorModel? prestador;
  UnidadeAtendimentoModel? unidadeAtendimento;

  ItemAgendaModel(
      {this.idItemAgenda,
      this.idAgenda,
      this.horaAgenda,
      this.snAtendido,
      this.itemAgendamento,
      this.prestador,
      this.unidadeAtendimento});

  factory ItemAgendaModel.fromJson(Map<String, dynamic> json) {
    return ItemAgendaModel(
      idItemAgenda: json['idItemAgenda'],
      idAgenda: json['idAgenda'],
      horaAgenda: json['horaAgenda'],
      snAtendido: json['snAtendido'],
      itemAgendamento: json['itemAgendamento'] != null
          ? ItemAgendamentoModel.fromJson(json['itemAgendamento'])
          : null,
      prestador: json['prestador'] != null
          ? PrestadorModel.fromJson(json['prestador'])
          : null,
      unidadeAtendimento: json['unidadeAtendimento'] != null
          ? UnidadeAtendimentoModel.fromJson(json['unidadeAtendimento'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idItemAgenda'] = idItemAgenda;
    data['idAgenda'] = idAgenda;
    data['horaAgenda'] = horaAgenda;
    data['snAtendido'] = snAtendido;
    data['itemAgendamento'] = itemAgendamento!.toJson();
    data['prestador'] = prestador!.toJson();
    data['unidadeAtendimento'] = unidadeAtendimento!.toJson();
    return data;
  }
}

class LanctoFinanc {}
