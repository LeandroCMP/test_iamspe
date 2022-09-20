class BoletoPdfModel {
  String? boleto;
  int? paginas;

  BoletoPdfModel({this.boleto, this.paginas});

  factory BoletoPdfModel.fromJson(Map<String, dynamic> json) {
    return BoletoPdfModel(
      boleto: json['boleto'],
      paginas: json['paginas'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boleto'] = boleto;
    data['paginas'] = paginas;
    return data;
  }
}
