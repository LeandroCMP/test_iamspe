import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/statement_attendance_store.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:share_plus/share_plus.dart';

class StatementAttendancePage extends StatefulWidget {
  const StatementAttendancePage({Key? key}) : super(key: key);
  @override
  _StatementAttendancePageState createState() =>
      _StatementAttendancePageState();
}

const debug = true;

class _StatementAttendancePageState extends State<StatementAttendancePage> {
  @override
  Widget build(BuildContext context) {
    final statementAttendanceStore = Modular.get<StatementAttendanceStore>();
    return statementAttendanceStore.isLoading == true
        ? LoadingComponent(
            isLoading: statementAttendanceStore.isLoading,
            child: Container(),
          )
        : page(
            context,
            statementAttendanceStore.generatedPdfFilePath,
          );
  }

  Widget page(BuildContext context, String? pathPDF) {
    final statementAttendanceStore = Modular.get<StatementAttendanceStore>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const TextComponent(
          text: 'Dec. Comparecimento',
          textColor: Colors.white,
          fontSize: 18,
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
              Share.shareFiles(
                [statementAttendanceStore.generatedPdfFilePath!],
              );
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(190, 222, 182, 1),
      ),

      /*AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              "assets/logo_transparente.png",
              fit: BoxFit.contain,
              height: 55,
              width: 95,
            ),
            TextButton(
                child: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 32,
                ),
                onPressed: () {
                  Share.shareFiles(
                      [statementAttendanceStore.generatedPdfFilePath!]);
                }),
          ],
        ),
        backgroundColor: const Color.fromRGBO(190, 222, 182, 1),
        elevation: 0,
      ),*/
      body: PDFViewer(document: statementAttendanceStore.doc!),
    );
  }
}
