class VersaoAppModel {
  String? versao;

  VersaoAppModel({this.versao});

  factory VersaoAppModel.fromJson(Map<String, dynamic> json) {
    return VersaoAppModel(
      versao: json['versao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['versao'] = versao;
    return data;
  }
}
