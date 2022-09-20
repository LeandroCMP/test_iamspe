class CadastroBeneficModel {
  int? prontuario;

  CadastroBeneficModel({this.prontuario});

  CadastroBeneficModel.fromJson(Map<String, dynamic> json) {
    prontuario = json['prontuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prontuario'] = prontuario;
    return data;
  }
}
