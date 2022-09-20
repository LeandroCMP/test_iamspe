class RequisicaoTokenModel {
  String? authorization;

  RequisicaoTokenModel({this.authorization});

  factory RequisicaoTokenModel.fromJson(Map<String, dynamic> json) {
    return RequisicaoTokenModel(
      authorization: json['authorization'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization'] = authorization;
    return data;
  }
}
