import 'dart:developer' as dev;
import 'dart:io';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/declaracaoComparecimento.model.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
part 'statement_attendance_store.g.dart';

class StatementAttendanceStore = _StatementAttendanceStoreBase
    with _$StatementAttendanceStore;

abstract class _StatementAttendanceStoreBase with Store {
  final loginController = Modular.get<LoginController>();

  @observable
  String? generatedPdfFilePath;
  @observable
  bool ePaciente = false;
  @observable
  bool isLoading = true;
  @observable
  PDFDocument? doc;
  @observable
  bool paciente = false;
  @observable
  DeclaracaoComparecimentoModel? declaracaoResult;

  @action
  callPage(paciente, declaracao) async {
    if (!loginController.tokenExpired(context)) {
      ePaciente = paciente;
      declaracaoResult = declaracao;
      await carregarPdf();
      isLoading = false;
      Modular.to.pushNamed('/declaration/attendance');
    }
  }

  @action
  carregarPdf() async {
    try {
      var tokenImg = "data:image/jpeg;charset=utf-8;base64, " +
          declaracaoResult!.qrCodeToken!;
      Directory appDocDir = await getApplicationDocumentsDirectory();
      final targetPath = appDocDir.path;
      final htmlContent = """
 <!DOCTYPE html>
<html>
  <head>
    <style>
    table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
    }
    th, td, p {
      padding: 5px;
      text-align: left;
    }
    </style>
  </head>
  <body>
    
  <div style="display: flex; margin-bottom: 5%;">
    <div style="width: 8px; height:8px; margin-left: 8%; margin-right:8%">
      <img src="file:///android_asset/flutter_assets/assets/logo_simples.png" width="80" height="60">
    </div>
    <div style="flex-grow: 1; text-align: center; margin-right:2%; margin-left:2%; font-size:6px;">
      <strong>Instituto de Assistência Médica ao Servidor Público Estadual</strong>
      <br>
      <strong>HSPE - Hospital do Servidor Público Estadual</strong>
    </div>
    <div style="font-size:6px; margin-right: 10%; border-color: black; border: 3px solid; padding: 3px;">
      <strong>Data/Hora: ${ePaciente ? declaracaoResult!.dataHoraEntradaPaciente : declaracaoResult!.dataHoraEntradaAcompanhante}</strong>
      <br>
      <strong>Nº Atend.: ${declaracaoResult!.codigoAtendimento}</strong>
      <br>
      <strong>Operador: IAMSPEMV</strong>
    </div>
  </div>

    <div style="text-align: center; background-color: rgb(190, 222, 182); margin-top:20%">
        <h2>Declaração de Comparecimento ${ePaciente ? '' : 'Acompanhante'}</h2>
    </div>
    
   <div style="text-align: justify !important; padding-left: 5%;padding-right: 5%; margin-top: 15%;">
       ${ePaciente ? 'Declaramos para fins de Lei Complementar nº 1.401, de 14/04/2008, publicando no D.O.E em 15/04/2008, que a paciente <strong>${declaracaoResult!.paciente!.nomePaciente}</strong>, prontuário: ${declaracaoResult!.paciente!.prontuario}, CPF: ${declaracaoResult!.paciente!.numeroCpf}, compareceu ao HSPE para atendimento com profissional de saúde em, <strong>${declaracaoResult!.dataHoraEntradaPaciente}</strong> até <strong>${declaracaoResult!.dataHoraSaidaPaciente}</strong>.' : 'Declaramos para os deviso fins, que o(a) Sr(a) <strong>${declaracaoResult!.acompanhante!.nomeAcompanhante}</strong>, portador(a) do CPF ${declaracaoResult!.paciente!.numeroCpf}, esteve nesta Instituição no dia <strong>${declaracaoResult!.dataHoraEntradaPaciente}</strong> até <strong>${declaracaoResult!.dataHoraSaidaPaciente}</strong>, acompanhando o(a) Sr(a) <strong>${declaracaoResult!.paciente!.nomePaciente}</strong> em consulta/exame.'}
   </div>
   <div style="text-align: justify; padding-left: 5%;padding-right: 5%; margin-top: 5%;">
    <strong>ESTE DOCUMENTO NÃO TEM VALOR DE ATESTADO MÉDICO.</strong>
   </div>
   <div class="col-md-12" style="display: flex; padding-right: 5%; margin-top: 25%;">
      <div>
        <img src="$tokenImg" width="100" height="100">
      </div>
      <div style="margin-top: 10px; text-align: start;font-size: 10px !important;">
        <strong>Declaração de Comparecimento</strong>
        <br>
        Essa declaração foi emitida eletronicamente.
        <br>
        Para verificar sua veracidade, aponte a câmera do seu celular para o QR Code ou
        <br>
        Acesse <strong>http://app.iamspe.sp.gov.br/declaracao</strong> 
        <br>
        Token: <strong>${declaracaoResult!.tokenAcesso}</strong> Senha: <strong>${declaracaoResult!.cdDesbloqueio}</strong>
    </div>
   </div>

   <hr style="width:80%;text-align:center; margin-top: 15%;">

   <div style="text-align: center;">
       <h6>Av. Ibirapuera, 981 - São Paulo - SP - Telefone: (11) 4573-8000 - www.iamspe.sp.gov.br</h6>
   </div>
  </body>
</html>
    """;

      dev.log("------------------$targetPath");
      const targetFileName = "declaracao-comparecimento";

      final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent,
        targetPath,
        targetFileName,
      );
      doc = await PDFDocument.fromFile(generatedPdfFile);
      isLoading = false;
      return generatedPdfFilePath = generatedPdfFile.path;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar pdf da declaração',
        error: ex.toString(),
      );
      return null;
    }
  }
}
