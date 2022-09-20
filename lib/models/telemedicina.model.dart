import 'package:iamspeapp/models/agenda.model.dart';
import 'package:iamspeapp/models/itemAgendamento.model.dart';

class TelemedicinaModel {
  int? idItemAgenda;
  String? horaAgenda;
  int? tempoLiberacao;
  AgendaModel? agenda;
  ItemAgendamentoModel? itemAgendamento;

  TelemedicinaModel(
      {this.idItemAgenda,
      this.horaAgenda,
      this.tempoLiberacao,
      this.agenda,
      this.itemAgendamento});

  factory TelemedicinaModel.fromJson(Map<String, dynamic> json) {
    return TelemedicinaModel(
      idItemAgenda: json['idItemAgenda'],
      horaAgenda: json['horaAgenda'],
      tempoLiberacao: json['tempoLiberacao'],
      agenda:
          json['agenda'] != null ? AgendaModel.fromJson(json['agenda']) : null,
      itemAgendamento: json['itemAgendamento'] != null
          ? ItemAgendamentoModel.fromJson(json['itemAgendamento'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idItemAgenda'] = idItemAgenda;
    data['horaAgenda'] = horaAgenda;
    data['tempoLiberacao'] = tempoLiberacao;
    data['agenda'] = agenda!.toJson();
    data['itemAgendamento'] = itemAgendamento!.toJson();
    return data;
  }
}
