import 'package:flutter/material.dart';
import 'package:iamspeapp/models/mensagens/mensagem-alerta.model.dart';
import 'package:iamspeapp/models/mensagens/notificacao.model.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class NotificacoesPage extends StatefulWidget {
  final List<MensagemAlertaModel> mensagensCarregadas;
  const NotificacoesPage({
    Key? key,
    required this.mensagensCarregadas,
  }) : super(key: key);
  @override
  _NotificacoesPageState createState() => _NotificacoesPageState();
}

class _NotificacoesPageState extends State<NotificacoesPage> {
  List<MensagemAlertaModel> mensagens = [];
  final notificationList = <NotificacaoModel>[];

  @override
  @protected
  void initState() {
    super.initState();
    mensagens = widget.mensagensCarregadas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Notificações',
        helperTitle: 'Notificações',
        msg: 'Aqui você tem acesso a todas as Notificações do APP',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: mensagens.isNotEmpty
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: mensagens.length,
                itemBuilder: (context, index) {
                  for (var notification in mensagens) {
                    notificationList.add(notification.notification!);
                  }
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.network(
                          'https://dhg1h5j42swfq.cloudfront.net/2018/04/16080554/iamspe.png',
                          color: Colors.grey,
                          scale: 15,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${notificationList[index].title}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 05),
                            Text(
                              '${notificationList[index].body}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: () {
                            print(index);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ));
                })
            : const Center(
                child: Text(
                  "Nenhuma notificação sem visualização!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
