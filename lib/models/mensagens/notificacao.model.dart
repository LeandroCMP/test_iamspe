class NotificacaoModel {
  String? title;
  String? body;

  NotificacaoModel({
    this.title,
    this.body,
  });

  factory NotificacaoModel.fromMap(Map<String, dynamic> map) {
    return NotificacaoModel(
      title: map['title'],
      body: map['body'],
    );
  }

  factory NotificacaoModel.fromJson(Map<String, dynamic> json) {
    return NotificacaoModel(
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
