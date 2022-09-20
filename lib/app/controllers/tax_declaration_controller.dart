import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/repositories/financial/financial_repository_impl.dart';
import 'package:iamspeapp/models/declaracaoRenda.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/config/settings.dart';

class TaxDeclarationController {
  final loginController = Modular.get<LoginController>();
  FinancialRepositoryImpl repository = FinancialRepositoryImpl();
  DeclaracaoRendaModel declaration = DeclaracaoRendaModel();
  Future<DeclaracaoRendaModel?> carregarDeclaracao(
    idBeneficiary,
    idMed,
  ) async {
    try {
      await loginController.carregarUsuario();
      final response = await repository.getDeclarationData(
        idBeneficiary,
        idMed,
        Settings.usuario!.token!,
      );
      declaration = response;
      return declaration;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar declaracao repository',
        error: ex.toString(),
      );
      return null;
    }
  }

  getDataList() async {
    loginController.carregarUsuario();
    UsuarioLogadoModel? usuario = Settings.usuario;
    final repository = FinancialRepositoryImpl();
    final result = await repository.getStatements(
      usuario!.idBeneficiario,
      usuario.token!,
    );
    return result;
  }
}
