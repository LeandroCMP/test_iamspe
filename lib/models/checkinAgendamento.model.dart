class CheckinAgendamentoModel {
  int? idItemAgenda;

  CheckinAgendamentoModel({this.idItemAgenda});

  factory CheckinAgendamentoModel.fromJson(Map<String, dynamic> json) {
    return CheckinAgendamentoModel(
      idItemAgenda: json['idItemAgenda'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idItemAgenda'] = idItemAgenda;
    return data;
  }
}
