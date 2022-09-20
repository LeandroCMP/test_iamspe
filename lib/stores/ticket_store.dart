import 'dart:developer' as dev;
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/ticket_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/boleto.model.dart';
import 'package:iamspeapp/models/boletoPdf.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/views/ticket_list_view.dart';
import 'package:mobx/mobx.dart';
part 'ticket_store.g.dart';

class TicketStore = _TicketStoreBase with _$TicketStore;

abstract class _TicketStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final ticketController = Modular.get<TicketController>();

  @observable
  List<BoletoModel>? listaBoletos;
  @observable
  List<TicketListViewPage>? selectedBoleto;
  @observable
  bool? sort;
  @observable
  UsuarioLogadoModel? usuario;
  @observable
  bool isLoading = true;
  @observable
  bool ticketIsLoading = true;
  @observable
  BoletoPdfModel? arquivo;
  @observable
  Uint8List? bytes;
  @observable
  File? file;
  @observable
  String pathPDF = "";
  @observable
  List<int>? pdfDataBytes;
  @observable
  PDFDocument? doc;
  @observable
  String? idTitulo;
  @observable
  String? idBeneficiario;

  callPage(context) async {
    if (!loginController.tokenExpired(context)) {
      await getData();
      Modular.to.pushNamed('/ticket/list');
    }
  }

  callTicketPdfPage(context, idTitle, idBeneficiary) async {
    if (!loginController.tokenExpired(context)) {
      idTitulo = idTitle;
      idBeneficiario = idBeneficiary;
      await carregarBoleto();
      Modular.to.pushNamed('/ticket/pdf');
    }
  }

  Future<List<BoletoModel>?> getData() async {
    try {
      final result = await ticketController.getData();
      usuario = Settings.usuario;
      listaBoletos = result;
      listaBoletos ??= [];
      return listaBoletos;
    } catch (ex) {
      dev.log(
        'Erro excpetion ao carregar dados (get data) na store',
        error: ex.toString(),
      );
      return null;
    }
  }

  Future<BoletoPdfModel?> carregarBoleto() async {
    try {
      final result = await ticketController.getTicket(
        idTitulo,
        idBeneficiario,
      );
      arquivo = result;
      var pdf = await ticketController.generarPdf(arquivo!.boleto!);
      pathPDF = pdf.path;
      doc = await PDFDocument.fromFile(pdf);
      ticketIsLoading = false;
      return arquivo;
    } catch (ex) {
      dev.log(
        'Erro de exception ao gerar boleto',
        error: ex.toString(),
      );
      return null;
    }
  }
}
