import 'dart:developer' as dev;
import 'package:iamspeapp/app/repositories/escort/escort_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/user_models.dart';

class ScortsController {
  final repository = EscortRepositoryImpl();
  UsuarioLogadoModel? user = UsuarioLogadoModel();

  getData() async {
    try {
      user = Settings.usuario;
      final response = await repository.getEscorts(
        user!.cadBeneficiario!.prontuario,
        user!.token!,
      );
      return response;
    } catch (ex) {
      dev.log(
        'Erro de exception ao buscar acompanhantes no repository',
        error: ex.toString(),
      );
      return null;
    }
  }

  getDataByCPF(cpf) async {
    try {
      user = Settings.usuario;
      final response = await repository.getEscortsByCpf(
        cpf,
        user!.token!,
      );
      return response;
    } catch (ex) {
      dev.log(
        'Erro de exception ao buscar acompanhantes por cpf na controller',
        error: ex.toString(),
      );
      return null;
    }
  }

  changeEscortStatus(AcompanhanteModel escort, token) async {
    final repository = EscortRepositoryImpl();
    await repository.putEscort(
      escort,
      user!.token!,
    );
  }
}
