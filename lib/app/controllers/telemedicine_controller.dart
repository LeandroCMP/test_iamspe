import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_telemedicine.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/repositories/telemedicine/telemedicine_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/telemedicina.model.dart';
import 'package:iamspeapp/models/user_models.dart';

class TelemedicineController {
  final loginController = Modular.get<LoginController>();
  final alertTelemedicine = AlertTelemedicine();
  UsuarioLogadoModel? user = UsuarioLogadoModel();

  Future<List<TelemedicinaModel>?> carregarDados() async {
    try {
      loginController.carregarUsuario();
      user = Settings.usuario;
      var repository = TelemedicineRepositoryImpl();
      var resposta = await repository.getSchedules(
        user!.cadBeneficiario!.prontuario,
        user!.token!,
      );
      return resposta;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados',
        error: ex.toString(),
      );
      return null;
    }
  }
}
