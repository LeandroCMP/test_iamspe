import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/models/boleto.model.dart';
import 'package:iamspeapp/stores/ticket_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class TicketListViewPage extends StatefulWidget {
  const TicketListViewPage({Key? key}) : super(key: key);

  @override
  _TicketListViewPageState createState() => _TicketListViewPageState();
}

class _TicketListViewPageState extends State<TicketListViewPage> {
  final ticketStore = Modular.get<TicketStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Boletos',
        helperTitle: 'Boletos',
        msg: 'Aqui você tem acesso a 2º via de seus boletos!',
      ),
      body: FutureBuilder<List<BoletoModel>?>(
        future: ticketStore.getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<BoletoModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (ticketStore.listaBoletos!.isEmpty) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Nenhum item disponível.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return page(context);
            }
          } else {
            return LoadingComponent(
              isLoading: ticketStore.isLoading,
              child: null,
            );
          }
        },
      ),
    );
  }

  Widget page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ticketStore.listaBoletos!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ticketStore.callTicketPdfPage(
                context,
                ticketStore.listaBoletos![index].idTitulo,
                ticketStore.usuario!.idBeneficiario,
              );
            },
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(05),
              decoration: BoxDecoration(
                color: const Color(0xFFf0f0f0),
                border: Border.all(
                  color: const Color(0xFFe6e6e6),
                ),
                borderRadius: BorderRadius.circular(05),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.request_page_outlined,
                  size: 36,
                  color: Colors.black54,
                ),
                title: const TextComponent(
                  text: '2º Via Boleto',
                  textColor: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextComponent(
                      text:
                          'Plano: ${ticketStore.listaBoletos![index].lanctoFinanc!.tipoBeneficio!.descTipoBeneficio!}',
                      textColor: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10),
                    TextComponent(
                      text:
                          'Valor Total: ${ticketStore.listaBoletos![index].valorTitulo.toString()}',
                      textColor: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextComponent(
                          text:
                              'Vencimento: ${ticketStore.listaBoletos![index].dataVencimento!}',
                          fontSize: 16,
                          textColor: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
