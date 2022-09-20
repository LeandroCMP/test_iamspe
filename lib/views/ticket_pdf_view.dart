import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/boletoPdf.model.dart';
import 'package:iamspeapp/stores/ticket_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:share_plus/share_plus.dart';

class TicketPdfPage extends StatefulWidget {
  const TicketPdfPage({Key? key}) : super(key: key);

  @override
  _TicketPdfPageState createState() => _TicketPdfPageState();
}

class _TicketPdfPageState extends State<TicketPdfPage> {
  final loginController = Modular.get<LoginController>();
  final ticketStore = Modular.get<TicketStore>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ticketStore.carregarBoleto(),
      builder: (
        BuildContext context,
        AsyncSnapshot<BoletoPdfModel?> snapshot,
      ) {
        if (snapshot.hasData) {
          return page(context, ticketStore.pathPDF);
        } else {
          return LoadingComponent(
            isLoading: ticketStore.ticketIsLoading,
            child: Container(),
          );
        }
      },
    );
  }

  Widget page(BuildContext context, String pathPDF) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const TextComponent(
          text: '2º Via do Boleto',
          textColor: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF7ec345),
                Color(0xFF03aabd),
              ],
              stops: [0.4, 0.8],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_outlined),
            iconSize: 25,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            iconSize: 35,
            onPressed: () {
              Share.shareFiles([pathPDF]);
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(190, 222, 182, 1),
      ),
      body: PDFViewer(document: ticketStore.doc!),
    );
  }
}
