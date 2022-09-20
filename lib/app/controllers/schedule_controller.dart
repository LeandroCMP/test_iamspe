import 'dart:developer' as dev;
import 'package:iamspeapp/app/repositories/schedule/schedule_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/user_models.dart';

class ScheduleController {
  UsuarioLogadoModel? user = UsuarioLogadoModel();

  getData() async {
    try {
      user = Settings.usuario;
      var repository = ScheduleRepositoryImpl();
      var response = await repository.getSchedules(
        user!.cadBeneficiario!.prontuario,
        user!.token!,
      );
      return response;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados',
        error: ex.toString(),
      );
      return null;
    }
  }

  getDataHistory() async {
    try {
      user = Settings.usuario;
      var repository = ScheduleRepositoryImpl();
      var response = await repository.getSchedulesHistory(
        user!.cadBeneficiario!.prontuario,
        user!.token!,
      );
      return response;
    } catch (ex) {
      dev.log(
        'Exception ao carregar dados do histórico',
        error: ex.toString(),
      );
      return null;
    }
  }
}
