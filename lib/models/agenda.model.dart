import 'package:iamspeapp/models/item-agenda.model.dart';

class AgendaModel {
  int? prontuario;
  String? nomePaciente;
  String? numeroCpf;
  String? mensagemErro;
  List<ItemAgendaModel>? listaItemAgenda;
  List<ItemAgendaModel>? listaItemAgendaHistorico;

  AgendaModel({
    this.prontuario,
    this.nomePaciente,
    this.numeroCpf,
    this.mensagemErro,
    this.listaItemAgenda,
    this.listaItemAgendaHistorico,
  });

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
      prontuario: json['prontuario'],
      nomePaciente: json['nomePaciente'],
      numeroCpf: json['numeroCpf'],
      mensagemErro: json['mensagemErro'],
      listaItemAgenda: json['listaItemAgenda'] != null
          ? (json['listaItemAgenda'] as List)
              .map((i) => ItemAgendaModel.fromJson(i))
              .toList()
          : [],
      listaItemAgendaHistorico: json['listaItemAgendaHistorico'] != null
          ? (json['listaItemAgendaHistorico'] as List)
              .map((i) => ItemAgendaModel.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prontuario'] = prontuario;
    data['nomePaciente'] = nomePaciente;
    data['numeroCpf'] = numeroCpf;
    data['mensagemErro'] = mensagemErro;
    data['listaItemAgenda'] = listaItemAgenda!.toList();
    data['listaItemAgendaHistorico'] = listaItemAgendaHistorico!.toList();
    return data;
  }
}
