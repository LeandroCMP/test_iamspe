import 'package:iamspeapp/models/mensagens/notificacao.model.dart';

class MensagemAlertaModel {
  final NotificacaoModel? notification;
  final Map<String, dynamic>? data;
  final String? messageId;
  bool? backgroundReceive;

  MensagemAlertaModel(
      {this.notification, this.data, this.messageId, this.backgroundReceive});

  factory MensagemAlertaModel.fromMap(Map<String, dynamic> map) {
    return MensagemAlertaModel(
      notification: map['notification'] == null
          ? null
          : NotificacaoModel.fromMap(
              Map<String, dynamic>.from(map['notification'])),
      data: map['data'] == null
          ? <String, dynamic>{}
          : Map<String, dynamic>.from(map['data']),
      messageId: map['messageId'].toString(),
    );
  }

  factory MensagemAlertaModel.fromJson(Map<String, dynamic> json) {
    return MensagemAlertaModel(
      notification: json['notification'] != null
          ? NotificacaoModel.fromJson(json['notification'])
          : null,
      data: json['data'] != null
          ? Map<String, dynamic>.from(json['data'])
          : <String, dynamic>{},
      messageId: json['messageId'],
      backgroundReceive: json['backgroundReceive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification'] = notification!.toJson();
    data['data'] = this.data;
    data['messageId'] = messageId;
    data['backgroundReceive'] = backgroundReceive;
    return data;
  }
}
