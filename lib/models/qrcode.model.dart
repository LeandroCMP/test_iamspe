class QRCodeModel {
  String? base64;
  String? formato;

  QRCodeModel({
    this.base64,
    this.formato,
  });

  factory QRCodeModel.fromJson(Map<String, dynamic> json) {
    return QRCodeModel(
      base64: json['base64'],
      formato: json['formato'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base64'] = base64;
    data['formato'] = formato;
    return data;
  }
}
