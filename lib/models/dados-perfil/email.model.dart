class EmailModel {
  String? idBeneficiario;
  String? descEmail;
  String? descricaoEmail;
  String? idEmail;

  EmailModel({
    this.idBeneficiario,
    this.descEmail,
    this.descricaoEmail,
    this.idEmail,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      idBeneficiario: json['idBeneficiario'] ?? '',
      descEmail: json['descEmail'] ?? '',
      descricaoEmail: json['descricaoEmail'] ?? '',
      idEmail: json['idEmail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idBeneficiario'] = idBeneficiario;
    data['descEmail'] = descEmail;
    data['descricaoEmail'] = descricaoEmail;
    data['idEmail'] = idEmail;

    return data;
  }
}
