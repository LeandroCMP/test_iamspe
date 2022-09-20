class StatusBeneficiarioModel {
  String? idMotivoStatus;
  String? descStatus;
  int? idAtivo;

  StatusBeneficiarioModel({this.idMotivoStatus, this.descStatus, this.idAtivo});

  factory StatusBeneficiarioModel.fromJson(Map<String, dynamic> json) {
    return StatusBeneficiarioModel(
      idMotivoStatus: json['idMotivoStatus'] ?? '',
      descStatus: json['descStatus'] ?? '',
      idAtivo: json['idAtivo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMotivoStatus'] = idMotivoStatus;
    data['descStatus'] = descStatus;
    data['idAtivo'] = idAtivo;
    return data;
  }
}
