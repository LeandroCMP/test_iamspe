import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/repositories/financial/financial_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:path_provider/path_provider.dart';

class TicketController {
  final loginController = Modular.get<LoginController>();
  UsuarioLogadoModel? user;

  getData() async {
    try {
      loginController.carregarUsuario();
      user = Settings.usuario;
      var repository = FinancialRepositoryImpl();
      var response = await repository.getTicket(
        user!.idBeneficiario,
        user!.token!,
      );
      return response;
    } catch (ex) {
      dev.log(
        "Erro de exception ao carregador dados (get data) na controller",
        error: ex.toString(),
      );
    }
  }

  getTicket(idTitle, idBeneficiary) async {
    try {
      loginController.carregarUsuario();
      user = Settings.usuario;
      final repository = FinancialRepositoryImpl();
      final response = await repository.getTicketPdf(
        idBeneficiary,
        idTitle,
        user!.token!,
      );
      return response;
    } catch (e) {
      dev.log(
        'Erro de exception ao carregador boleto na controller',
        error: e.toString(),
      );
    }
  }

  Future<File> generarPdf(String base64String) async {
    var bytes = base64Decode(base64String.replaceAll('\n', ''));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/boleto.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());
    return file;
  }
}
